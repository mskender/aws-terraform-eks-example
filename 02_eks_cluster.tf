module "eks" {
    # Creates EKS cluster and, optionally, an on-demand autoscaling node group. 
    # Will dump kube config file to disk on location specified by kube_config_location var and optionally set KUBECONFIG env var in shellrc_file. 
    source = "github.com/mskender/aws-terraform-eks.git?ref=v0.2.1"
    region = var.region
    
    cluster_name = local.cluster_name
    prefix = var.prefix

    create_cluster = false
    create_node_group = true
    eks_subnet_ids = module.network.public_subnets.*.id

    eks_worker_scaling = {
        max_size = 3
        min_size = 1
        desired_size = 1
    }

    write_kube_config = true
    kube_config_location = local.kubeconfig_loc
    export_kube_config = false
    shellrc_file = "~/.customization"   

    depends_on = [
        module.network#
    ] 
}