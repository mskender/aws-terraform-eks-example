module "network" {

    # Create default VPC layout (private+public subnets) and/or NAT GW and/or SSM endpoints for remote control.
    # Supports subnet tagging for EKS selectors/annotations.
    source = "github.com/mskender/aws-terraform-network.git?ref=v0.3.0"
    region = var.region
    
    create_private_subnets=false
    create_public_subnets = true
    subnet_size = 24
    prefix = var.prefix

    create_igw=true
    create_natgw = false
    create_ssm_endpoint = false
    map_public_ips = true
    
    #Karpenter autoscaler uses these tags for discovery:
    public_subnet_additional_tags = {
        "kubernetes.io/cluster/${local.cluster_name}" = "owned"
    }
}