module "argocd" {

install_argocd = false
source = "github.com/mskender/aws-terraform-eks-argocd.git?ref=v0.0.3"

hostname = "argocd.eks.example.com"
enable_ingress = true
enable_grpc = true
use_tls = true
ingress_class = var.ingress_class
cluster_issuer = var.clusterissuer_name

providers = {
    helm = helm.eks
}
depends_on = [
  module.eks,
  module.ingress_nginx,
  module.cert_manager
]
}
