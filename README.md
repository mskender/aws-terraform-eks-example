## Simple EKS deployment using modules

This is a simple, runnable example of a modular EKS deployment.
Each module has it's own repo README which you can peruse for a list of inputs and outputs.

To avoid unecessary complications, try to deploy in top-down fashion (going through files { 01...nn } and using create/install switches to turn modules on/off)

## Essentials

### Providers

The proivders needed for the whole deployment:

- AWS
- Helm
- Kubectl

The Helm and Kubectl providers need to be scoped/aliased since they need a working kube config which does not exist before EKS cluster is created.
Aliased providers are not checked for dependencies at plan time, so by using `depends_on` for EKS module in modules using these providers we can 


### VPC

Source:
https://github.com/mskender/aws-terraform-network


This is a simple VPC deployment module, using a cookie-cutter layout and features:

- private subnets 
- public subnets
- IGW and NATGW
- SSM endpoints

[VPC deployment](01_vpc.tf)

## EKS infrastructure

### EKS Cluster

Source:
https://github.com/mskender/aws-terraform-eks


This is a simple EKS cluster deployment module, using simple defaults and features

- an EKS cluster/control node
- optional autoscaling node group
- export kube config file to disk
- export KUBECONFIG env var to RC file

[EKS cluster deployment](02_eks_cluster.tf)


### EKS Node group

Source:
https://github.com/mskender/aws-terraform-eks-node-group

Launch additional EKS autoscaling node groups via this module.

Supports customizing:

- autoscaling limits
- capacity type
- instancxe types
- taints
- labels


[EKS node group deployment](03_eks_node_group.tf)


### EKS Node group

Source:
https://github.com/mskender/aws-terraform-eks-node-group

Launch additional EKS autoscaling node groups via this module.

Supports customizing:

- autoscaling limits
- capacity type
- instancxe types
- taints
- labels


[EKS node group deployment](03_eks_node_group.tf)

## Kubernetes deployments

### Karpenter

Source:
https://github.com/mskender/aws-terraform-eks-karpenter

Deploy Karpenter autoscaler in EKS cluster.
Supports features:

- launch templates
- capacity type
- arch and ami type
- subnet selection by tag
- subnet selection by name


[Karpenter deployment](04_karpenter.tf)


### Ingress (nginx)

Source:
https://github.com/mskender/aws-terraform-eks-ingress-nginx

Deploy Ingress Nginx controller.



[Ingress Nginx controller deployment](05_ingress_nginx.tf)



### Cert-manager

Source:
https://github.com/mskender/aws-terraform-eks-cert-manager

Deploys Jetstack's Cert-manager. 
Currently deploys only LetsEncrypt's production ClusterIssuer based on http solver (depends on Ingress-Nginx)



[Cert-manager deployment](06_cert_manager.tf)