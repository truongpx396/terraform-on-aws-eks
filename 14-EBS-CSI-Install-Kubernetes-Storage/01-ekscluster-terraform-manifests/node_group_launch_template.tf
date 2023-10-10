resource "aws_launch_template" "node-group-launch-template" {
      name_prefix = "eks-node-group"
      # image_id    = var.template-image-id
    
      block_device_mappings {
        device_name = "/dev/sda1"
    
      ebs {
          volume_size = 20
        }
      }
    
      ebs_optimized = true
    
      user_data = base64encode(data.template_file.set-max-pods.rendered)
      # user_data = filebase64("${path.module}/example.sh")
    }
    
    data "template_file" "set-max-pods" {
      template = <<EOF
      MIME-Version: 1.0
      Content-Type: multipart/mixed; boundary="==MYBOUNDARY=="

      --==MYBOUNDARY==
      Content-Type: text/x-shellscript; charset="us-ascii"
      #!/bin/bash
      /etc/eks/bootstrap.sh ${aws_eks_cluster.eks_cluster.name} --use-max-pods false --kubelet-extra-args '--max-pods=110'
      --==MYBOUNDARY==--\
      EOF
    }