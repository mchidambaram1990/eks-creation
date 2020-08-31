EKS STEPS TO CREATE THROUGH TERRAFORM:
     1. Created the VPC, Subnet, Route table, Internet Gateway in vpc.tf file
     2. Created the Variables in variable.tf file
     3. Created the provider AWS in provider.tf file
     4. Created the EKS Cluster resources, EKS Cluster IAM role, EKS policies, EKS security group in eks-cluster.tf file
     5. Created the EKS worker node resources, Worker node IAM role and EKS Worker node policies in eks-worker-nodes.tf file.
     6. Created the output of the EKS cluster CONFIGMAPAWSAUTH and KUBECONFIG in outputs.tf file.


Pre-Requisites:
     Terraform plugin, Kubernetes plugin, kubernetes credentials provider, aws cli, aws-iam-authenticator, kubectl, git and others.


Steps to Integrate the terraform config files with Jenkins Pipeline:
     
    1. Add GitHub URL in the new Jenkins Pipeline. Give the right PATH for the Jenkinsfile.
    2. Add the AWS AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY credentials in Jenkins Global credentials. Make sure you installed all the Pre-Requisites mentioned above.
    3. Run the new pipeline. The cluster Creation will take around 13-15minutes. Once the cluster creation is finished, The Terraform apply stage will give the nodes ip addresses and the output file will give the kubeconfig  which is used as the Kubernetes credentials for the application Deployment.

