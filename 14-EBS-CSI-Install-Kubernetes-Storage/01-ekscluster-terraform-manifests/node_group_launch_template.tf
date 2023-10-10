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
    
      user_data = "${data.template_cloudinit_config.config.rendered}"
      # user_data = filebase64("${path.module}/example.sh")
    }

    data "template_cloudinit_config" "config" {
      gzip          = false
      base64_encode = true

      part {
        content = "${data.template_file.set-max-pods.rendered}"
      }
    }
    
     # /etc/eks/bootstrap.sh ${aws_eks_cluster.eks_cluster.name} --use-max-pods false --kubelet-extra-args '--max-pods=110'
    data "template_file" "set-max-pods" {
      template = <<-EOT
        #!/bin/bash
        LINE_NUMBER=$(grep -n "KUBELET_EXTRA_ARGS=\$2" /etc/eks/bootstrap.sh | cut -f1 -d:)
        REPLACEMENT="\ \ \ \ \ \ KUBELET_EXTRA_ARGS=\$(echo \$2 | sed -s -E 's/--max-pods=[0-9]+/--max-pods=109/g')"
        sed -i '/KUBELET_EXTRA_ARGS=\$2/d' /etc/eks/bootstrap.sh
        sed -i "$${LINE_NUMBER}i $${REPLACEMENT}" /etc/eks/bootstrap.sh
      EOT
    }

         