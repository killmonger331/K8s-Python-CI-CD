module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  access_entries = {
    admin = {
      principal_arn = "arn:aws:iam::200686070529:user/richardmorales_24"

      policy_associations = {
        admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }

  cluster_name    = "k8s-python-cluster"
  cluster_version = "1.29"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_irsa = true
  cluster_endpoint_public_access = true

  eks_managed_node_groups = {
    default = {
      name           = "default-node-group"
      instance_types = ["t3.small"]
      desired_size   = 2
      min_size       = 1
      max_size       = 3
    }
  }
}
