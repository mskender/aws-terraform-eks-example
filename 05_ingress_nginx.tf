module "ingress_nginx" {

# Deploys an Ingress Nginx Controller. 
# Needs an aliased Helm provider conf due to kube config file dependency from EKS module.

source = "github.com/mskender/aws-terraform-eks-ingress-nginx.git?ref=v0.0.1"

install_ingress = false

enable_external_lb = true 
enable_internal_lb = true 
ingress_class = var.ingress_class
namespace = "ingress-nginx"
create_namespace = true

providers = {
    helm = helm.eks
}
depends_on = [
  module.eks
]
}