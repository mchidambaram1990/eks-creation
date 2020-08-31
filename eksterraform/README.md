EKS STEPS TO CREATE THROUGH TERRAFORM:
     1. Created the VPC, Subnet, Route table, Internet Gateway in vpc.tf file
     2. Created the Variables in variable.tf file
     3. Created the provider AWS in provider.tf file
     4. Created the EKS Cluster resources, EKS Cluster IAM role, EKS policies, EKS security group in eks-cluster.tf file
     5. Created the EKS worker node resources, Worker node IAM role and EKS Worker node policies in eks-worker-nodes.tf file.
