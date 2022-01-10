module "cert_manager" {

source = "github.com/mskender/aws-terraform-eks-cert-manager.git?ref=v0.0.2"
# Deploys Jetstack's Cert-Manager controller with default prod LetsEncrypt ClusterIssuer. 
# Needs an aliased Helm provider conf due to kube config file dependency from EKS module.
install_cert_manager = false
cluster_issuer_name = var.clusterissuer_name
ingress_class = var.ingress_class
mail_address = "admin@test.com"


providers = {
    helm = helm.eks
    kubectl = kubectl.eks
}
depends_on = [
  module.eks,
  module.ingress_nginx
]
}