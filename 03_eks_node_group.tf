module "k8s-spot-workers" {
    
    #Launch additional groups as needed with this module, while specifying labels and taints.
    source = "github.com/mskender/aws-terraform-eks-node-group.git?ref=v0.1.2"
    
    create_node_group = false
    cluster_name = local.cluster_name
    node_group_name = local.nodegroup_name
    subnet_ids = module.network.public_subnets.*.id

    capacity_type = "SPOT"
    taint = [{
        key="spot"
        value="true"
        effect = "NO_SCHEDULE"
    }]

    node_scaling = {
        max_size = 5
        min_size = 1
        desired_size = 1
    }

    depends_on = [
      module.eks
    ]
}