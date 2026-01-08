# K8s-Python-CI-CD
A production-style Python web application deployed to AWS EKS with Docker, GitHub Actions CI/CD, GHCR image publishing, and NGINX Ingress.
The application is exposed securely via a custom domain and demonstrates a reuseable Kubernetes-based deployment platform rather than a single standalone app.

# Architecture Overview 

<img width="557" height="1113" alt="k8s_cicd_architecture" src="https://github.com/user-attachments/assets/7732e586-b7e4-47a7-84e8-c1747a765e38" />


# Key Features
- Kubernetes deployment on AWS EKS
- Fully automated CI/CD pipeline using GitHub Actions
- Docker image publishing to GitHub Container Registry (GHCR)
- Secure HTTPS traffic via AWS ALB & ACM
- Custom Domain routing using Route 53
- Infrastructure provisioned using Terraform
- Kubernetes manifests designed for reusuability across apps
- IAM roles for service accounts (IRSA) for secure controller permissions

# Infrastructure Stack
- Cloud Provider: AWS
- Container Orchestration: Amazon EKS
- Load Balancing: AWS Application Load Balancer
- TLS/HTTPS: AWS Certificate Manager
- DNS: Route 53
- CI/CD: GitHub Actions
- Container Registry: GitHub Container Registry
- IaC: Terraform
- Runtime: Docker
- App Framework: Python (FastAPI/Flask-style API)

# CI/CD Pipeline
On every push to main:
1. GitHub Actions builds a Docker image
2. Image is tagged and pushed to GHCR
3. Kubernetes manifests are applied to EKS
4. Deployment is rolled out with zero downtime
5. Traffic is routed automatically via ALB Ingress

# Security 
- No hardcoded AWS credentials
- IAM Roles for Service Accounts (IRSA) used for ALB controller
- TLS enforced using ACM-issued certificates
- Public access controlled exclusively through ALB
- Kubernetes-native service discovery
- Infrastructure separated from application code

## Example Deployment (Demo)

This repository deploys a sample FastAPI application to AWS EKS using
Docker, GitHub Actions CI/CD, and AWS ALB Ingress.

When the cluster is running, the demo app responds at:

GET /

Example response:
```json
{
  "status": "ok",
  "message": "Kubernetes app is running"
}
```
# What this Project Demonstrates
For this project i had to troubleshoot and debug particular issues that would arise in DNS, infrastructure code, and ALB. I learned and practiced the automated use of GitHub Actions, Infrastructure automation, and Kubernetes deployment patterns. The main takeaway was how applications are delivered, not just how they are written. 
# Future Improvements
- Add horizontal pod autoscaling (HPA)
- Add staging vs production environments
- Add monitoring (CloudWatch / Prometheus)
- Add request logging and metrics













