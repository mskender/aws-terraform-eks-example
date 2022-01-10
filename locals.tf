locals {

    cluster_name = "${var.prefix}-eks${var.suffix}"
    nodegroup_name = "${var.prefix}-eks-spot${var.suffix}"
    kubeconfig_loc = "~/.kube/config-${var.prefix}-eks"
    
}