resource "aws_launch_template" "node-group-launch-template" {
      name_prefix = "eks-node-group"
      # image_id    = var.template-image-id
    
      # block_device_mappings {
      #   device_name = "/dev/sda1"
    
      #   ebs {
      #     volume_size = var.ebs_size
      #   }
      # }
    
      # ebs_optimized = true
    
      user_data = base64encode(data.template_file.set-max-pods.rendered)
      # user_data = filebase64("${path.module}/example.sh")
    }
    
    data "template_file" "set-max-pods" {
      template = <<EOF
    /etc/eks/bootstrap.sh ${aws_eks_cluster.eks_cluster.name} --use-max-pods false --kubelet-extra-args '--max-pods=110'
      EOF
    }