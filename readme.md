
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
