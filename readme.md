# Inception Of Things

This project aims to deepen my DevOps knowledge by using k3s and k3d (kubernetes)
we have 3 part in this project and the first two part allow us to understand vagrant and to know some configuration of k3s (installation)

### What is kubernetes
Kubernetes, often abbreviated as K8s, is an open-source container orchestration platform that automates the deployment, scaling, and management of containerized applications

Kubernetes provides a robust and extensible infrastructure that facilitates the management of containerized applications by offering key features such as:

- Automated Deployment: Kubernetes allows for the deployment of applications in containers across a cluster, ensuring that new versions are rolled out without downtime.

- Scaling: It enables applications to scale by adding or removing container instances based on demand, optimizing resource utilization.

- Service Management: Kubernetes simplifies service discovery and communication among different components of an application, ensuring that they can interact effectively.

- Self-Healing: In the event of a container failure, Kubernetes can automatically restart, replace, or replicate the container to maintain application availability.

- Configuration and Secret Management: Kubernetes provides mechanisms to manage application configurations and sensitive information, separating data from code.

- Multi-Cloud and Hybrid Support: Kubernetes can operate in various environments, whether on-premises or in the cloud, allowing organizations to deploy applications in the environment that best suits their needs.

## part 1
In the first part we have to create 2 machine with vagrant and download k3s on controller mode in the first machine and k3s on agent mode in the second one.
and this two machine should be connected


## part 2
### Steps 
1. [Download K3s on a VM](#download-k3s-on-a-vm)
2. [Deploy 3 Web Applications](#deploy-3-web-applications)
3. [Configure Ingress for Host-Based Routing](#configure-ingress-for-based-routing)

4. [Create Multiple Replicas for Application 2](#create-multiple-replicas-for-application-2)
5. [Configure /etc/hosts for Simulating Domain Resolution](#configure-etchosts-for-simulating-domain-resolution)



### download K3s on a VM
- K3s is a simplified version of Kubernetes. we need to install it on a virtual machine with a dedicated IP (192.168.56.110).
- This VM will act as the control plane (master node) for the cluster.

### Deploy 3 web applications
- We need to deploy three web applications on your K3s cluster. These can be simple web servers like Nginx containers or custom applications built in Docker images.
- For each application, create a Deployment and a Service in Kubernetes.

### Configure Ingress for Host-Based Routing
- An Ingress in Kubernetes routes external HTTP/HTTPS traffic to services based on rules like the hostname or URL path.
- For this project, we need to configure an Ingress that:
    - Routes requests to app1 when the user inputs http://app1.com.
    - Routes to app2 when the user inputs http://app2.com.
    - Defaults to app3 if no other hostname matches.

### Create Multiple Replicas for Application 2
- For the app2 application, you need to configure its deployment with 3 replicas (instances) to ensure high availability and load balancing.
- We can configure replicas in the YAML file for the deployment by specifying replicas: 3.
- Key Concepts:
    - Horizontal scaling: Increasing the number of replicas (pods) to handle more traffic.
    - Load balancing: K3s will automatically distribute traffic across the replicas of the application.

### Configure /etc/hosts for Simulating Domain Resolution
- Since you're working in a local environment, you need to configure your local /etc/hosts file to map domain names (e.g., app1.com, app2.com) to your server's IP (192.168.56.110).

<img width="722" alt="Capture d’écran 2024-10-03 à 17 47 40" src="https://github.com/user-attachments/assets/387e3bfa-c331-426e-9286-f1ae6219b57f">



## PART 3
The goal of this part of the project is to implement continuous integration (CI) using K3D and Argo CD.
we will automate deployments and manage application versions through GitOps, ensuring that the application stays up-to-date with the latest changes pushed to our GitHub repository.


#### Difference between k3s and k3d:
- K3S: is a lightweight version of Kubernetes designed for resource-constrained environments.

- K3D: is a version of K3S that runs within Docker containers, making it easier to create local Kubernetes clusters.

#### Argo CD:
Argo CD is a declarative, GitOps continuous delivery tool for Kubernetes. It automates the deployment and management of applications in Kubernetes clusters by continuously monitoring Git repositories for changes and syncing them with our Kubernetes environment.

### Steps

1) [installation](#installation)
2) [Create a K3D Cluster](#Create-a-K3D-Cluster)
3)  [Access the Argo CD UI](#Access-the-Argo-CD-UI)
4)  [Configure Argo CD to Deploy an Application](#Configure-Argo-CD-to-Deploy-an-Application)
5) [Deploy the Application Using Argo CD](#Deploy-the-Application-Using-Argo-CD)
6) [Manage Application Versions](#Manage-Application-Versions)

### installation
we have to install 
- docker 
- k3d
- Argo CD
- kubectl
we should also create a bash script to automate the installation
### Create a K3D Cluster
Now, create a K3D Kubernetes cluster that Argo CD will use.
### Access the Argo CD UI
Forward the Argo CD API server to our localhost (Use the default Argo CD login)

- Username: admin
- Password: Get the initial password use 
-       kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d

### Configure Argo CD to Deploy an Application
Create a second namespace for our application:
-       kubectl create namespace dev

- Push our Kubernetes deployment configuration to a public GitHub repository.
- Inside Argo CD, link the GitHub repository so that Argo CD can track and sync our application's deployment.
### Deploy the Application Using Argo CD
- In Argo CD's UI, create a new application and point it to our GitHub repository that contains the deployment.yaml file
- Define the dev namespace as the target for this deployment.
- Sync the application, and it will deploy automatically to our K3D cluster.
### Manage Application Versions
- To implement continuous integration, we have to create two versions of our application and tag them in Dockerhub (e.g., v1 and v2).
- Update the deployment.yaml in our GitHub repository with the new image tag (e.g., wil42/playground:v1 to wil42/playground:v2).
- Push the change to GitHub, and Argo CD will automatically detect and update the application.

Don't forget to mapped the port of your application with a port from your local machine,
k3d is the same version as k3s but the difference is that k3d run in a docker container, that mean when i used the nodeport service for my app, it will be accessible only from my container because: nodeport allow the acces to our pods outside the cluster, but outside the cluster there is our container that mean i was abble to acces to my app only from my container, so to bypass that i mapped a specific port from my container to my local machine and i use this port for my app.
