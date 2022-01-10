variable region {
    description = "Which AWS region to use."
    type = string
    default = "eu-west-1"
}

variable prefix {
    description = "Optional prefix for (most) resources"
    type = string
    default = "myprefix"
}

variable suffix {
    description = "Optional suffix for (most) resources"
    type = string
    default = ""
}

 variable ingress_class {
    type = string    
    description = "Ingress class name"
    default  = "nginx"
 }

 variable clusterissuer_name {

    type = string    
    description = "Cert-manager Clusterissuer name"
    default  = "letsencrypt-prod"
 }
variable tags {
    
    description = "Tags to apply to everything as default tags in the provider."
    default = {
        "owner" = "mskender@schubergphilis.com"
        "project" = "EKS test" 
    }
}
