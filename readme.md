# Infrastructure on Google Cloud Platform (GCP) using Terraform and GitLab CI

## Objective: Secure Infrastructure Deployment on GCP

### Overview:
You are tasked with deploying a secure infrastructure on Google Cloud Platform (GCP) using
Terraform and automating the deployment process with GitLab CI. Your infrastructure should
consist of the following components:
- Virtual Private Cloud (VPC) with private and public subnets.
- Two Compute Engine instances: one in the public subnet and one in the private subnet.
- Nginx installed and running on the Compute Engine instance in the public subnet, serving
a static HTML page.
- The Compute Engine instance in the private subnet should not have direct internet
access.

### Requirements:
- Use Terraform to define and provision the infrastructure resources on GCP.
- Create a GitLab CI pipeline that triggers the infrastructure deployment on every commit
to the main branch.
- Ensure that the pipeline fails if there are any syntax or linting errors in the Terraform
configuration.
- Store sensitive information (e.g., GCP service account credentials) securely, following
best practices.
- Use GitLab CI variables to store and retrieve sensitive information within the pipeline.
- Implement appropriate security measures, such as firewall rules and VPC service
controls, to restrict access and enhance the security posture of the infrastructure.
Deliverables:
- A GitLab repository containing the Terraform configuration and GitLab CI pipeline
definition.
- A brief documentation explaining the steps to set up and execute the pipeline.
- A demo or video recording demonstrating the successful deployment of the
infrastructure.
The candidate should demonstrate their knowledge of Terraform, GitLab CI, GCP, and best
practices for secure infrastructure deployment. They should be able to design and implement
the infrastructure, handle sensitive information securely, and automate the deployment process
effectively.