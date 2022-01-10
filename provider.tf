provider "aws" { 
   region = var.region
   default_tags  {
       tags=var.tags
   }
      
}
# Required (non-default) aliased providers because aliased providers aren't validated at plan time
# config_path kube config not preset untill eks module is created.
provider kubectl {
    alias = "eks"
    config_path = local.kubeconfig_loc
    
}
provider helm {

    alias = "eks"
    kubernetes{
        config_path = local.kubeconfig_loc
    }
}

terraform {  
    required_providers {    
        aws = {      
            version = ">=3.38.0"
        }
        kubectl = {

            source  = "gavinbunney/kubectl"
        }
        helm = {}
    }
}
