# CI/CD Pipeline and Monitoring Setup

This project demonstrates a CI/CD pipeline and monitoring setup using GitHub Actions, Docker, Kubernetes, ArgoCD, Prometheus, and Grafana. The goal is to automate the process of building, testing, scanning, and deploying applications to a Kubernetes cluster.

## Steps

### Security and Code Quality Checks

1. **Added Gitleaks to check for hardcoded credentials**  
   Gitleaks scans the repository for sensitive data like passwords or API keys and fails the CI piepline if any are found.

2. **Added Linters to check for code quality**  
   Linters (such as ESLint and stylelint) are used to automatically check the code for potential errors, code style violations, or other issues.

3. **Used SonarQube for code quality analysis**  
   SonarQube provides detailed insights into the quality of code by performing static analysis, checking for code smells, and evaluating code coverage.

4. **Used Snyk for Static Application Security Testing (SAST)**  
   Snyk scans the code for vulnerabilities in dependencies and suggests fixes for any identified security risks.

### Docker Build and Push

5. **Built Docker Image using GitHub Actions**  
   The Docker image for the application is built using GitHub Actions and the `Dockerfile`. It is tagged with the GitHub Actions runner ID to maintain uniqueness.

6. **Pushed Docker Image to Docker Hub**  
   After building the image, it is pushed to Docker Hub to be stored and made available for deployment.

### Scan Docker Image for Vulnerabilities

7. **Used Trivy to scan the Docker image for vulnerabilities**  
   Trivy scans the Docker image to identify any known vulnerabilities, ensuring that only secure images are deployed.

### Install ArgoCD on EKS

8. **Installed ArgoCD on Amazon EKS**  
   ArgoCD is installed on EKS to automate the deployment of Kubernetes resources by syncing them from a Git repository.

### Connect ArgoCD to Git Repository

9. **Connected ArgoCD to the Git repository**  
   The Git repository containing Kubernetes manifests is connected to ArgoCD to automatically trigger deployments whenever changes are pushed to the repository.

### Create Kubernetes Manifests

10. **Created Kubernetes deployment and service manifests**  
    Kubernetes deployment and service YAML files are created for the application to specify how it should be deployed, exposed, and scaled in the Kubernetes cluster.

### Expose Prometheus and Grafana

11. **Exposed Prometheus and Grafana**  
    Prometheus and Grafana are installed in the Kubernetes cluster to collect and visualize metrics for the deployed applications and cluster.

### Access Grafana and View Metrics

12. **Accessed Grafana via LoadBalancer**  
    Grafana is exposed via a LoadBalancer and can be accessed externally to view application metrics and create custom dashboards for monitoring.

---

## Next Steps

- **Pre-commit hooks**:
   - GitLeaks and linting could be implemented before the CI pipeline
   
- **Grafana Dashboards**:
   - Pre-built dashboards for Kubernetes, Prometheus, and other metrics can be imported directly from Grafana's dashboard repository.
   - Custom dashboards can be created to visualize additional metrics such as pod count, node health, and application-level performance.

- **Alerts**:
   - Alerts can be configured in Grafana to notify when critical issues arise, such as high CPU usage or failing pods.
   - Some of the monitoring utilities could be set up to send a notification via email/chat

- **Scaling**:
   - More services or applications can be added to the Kubernetes cluster, with ArgoCD managing their deployment and monitoring.