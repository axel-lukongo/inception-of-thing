
# Inception Of Things

This project aims to deepen your DevOps knowledge by using k3s (kubernetes)
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