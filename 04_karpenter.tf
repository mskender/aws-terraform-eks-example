module "karpenter" {

# Install Karpenter AWS autoscaler deployment. Must have working kube config already (hence dependancy on eks module.)
source = "github.com/mskender/aws-terraform-eks-karpenter.git?ref=v0.0.3"

install_karpenter = false

cluster_name = local.cluster_name
cluster_endpoint = module.eks.cluster_endpoint
oidc_url = module.eks.cluster_oidc_url

providers = {
    helm = helm.eks
    kubectl = kubectl.eks
}

ec2_tags = [
    {
        key = "Name",
        value = "${local.cluster_name}-karpenter-worker"
    }
]
instance_types = ["t3.medium"]
subnet_name_selector = "${var.prefix}-public*"
instance_profile_name = "${var.prefix}-eks-worker-role"

depends_on = [
  module.eks
]

}