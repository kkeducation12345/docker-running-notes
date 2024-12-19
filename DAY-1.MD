Docker syllabus KK FUNDA
===============
```
-->Docker Introduction
-->Containerization Vs Virtualization
-->Docker Installation & It’s Architecture, docker flow
-->Docker Adhoc Commands
-->Docker file
-->Docker Image
-->Docker Container
-->Docker Networks
-->Docker Volumes
-->Docker file & It’s KeyWords
-->Docker Images creation
-->Docker Registries (Docker Hub, ECR, Nexus)
-->Docker Compose
--> Docker with jenkins [github->build-->SQ-->Nexus-->docker image-->push--> container]
```

what is Docker?
===============
--> Docker is a popular platform for developing, shipping, and running applications using containerization technology. Containers allow you to package an application along with all its dependencies (such as libraries and configuration files) into a single component.



Similar tools like docker
=========================
podman, rocket, core os , etc


--> Docker available in two types
1. community edition [Open source and free]
2. enterprise edition [commercial]

Vendor: Docker Inc
Type: containerization

Ex: git -- SCM tool
    ant/maven/gradle -- Build tools
    Jenkins/Bomboo/Travis CI -- CICD tools
    Docker/core os/rocket --> containerization tools

OS: Docker is cross platform(Docker can be installed in any os)


Installtion of docker
=====================

https://www.docker.com/   -->offical website

https://docs.docker.com/  --> for documentation


step 1: Create one ec2 instance of type ubuntu. 

step 2: connect to that server.


step 3: 

   ``` 
   sudo apt update -y 
   sudo curl -fsSL https://get.docker.com -o install-docker.sh
   sudo sh install-docker.sh
```

       or
```
   sudo apt update -y
   sudo apt  install docker.io -y
```

       or
```
   sudo apt update -y
   sudo curl -fsSL https://get.docker.com | /bin/bash
```

step 4:

```
docker -v   # to check the version
```
 

docker info, docker ps, docker images --> we are getting some errors due to permission issues to ubuntu user becz its normal user, But root user we will not get any errors.

step 5: check the docker is running or not

```
ps -ef|grep -i "dockerd"
```
   
     or
```
sudo service docker status
```

step 6:

```
sudo usermod -aG docker ubuntu
```

step 7: docker ps # eventhough we added we are getting permission denied.

  exit and reconnect to the sever.

docker ps # As a normal user also can run the docker commands.


Docker architecture
===================



1. Docker Engine
-----------------
Docker Engine is the core component of Docker, responsible for building, running, and managing containers. It has two main parts:

Docker Daemon (dockerd): This is the background service that manages Docker containers and images. It handles container orchestration, image management, and network configuration. 

The Docker Daemon listens for Docker API requests and can communicate with other Docker Daemons to manage containers across multiple hosts.

2.Docker CLI (docker):
---------------------
The Docker Command Line Interface (CLI) is the tool used by developers and administrators to interact with the Docker Daemon. Commands like docker run, docker build, and docker ps are executed via the CLI to manage containers and images.

3. Docker Images
-----------------
Description: Docker images are the blueprints for Docker containers. They contain the application code, libraries, dependencies, and the runtime environment needed to run a specific application. Images are immutable and can be versioned and shared.

Layers: Docker images are built in layers. Each layer represents a set of changes or instructions in the image's Dockerfile. Layers are cached and reused, which helps in optimizing storage and build times.

4. Docker Containers
---------------------
Description: Containers are instances of Docker images. They are lightweight, portable, and run the application in isolation from the host system and other containers. Each container has its own filesystem, network stack, and process space.

Isolation: Containers use operating system-level virtualization to provide isolation. They share the host OS kernel but run in separate user spaces.

5. Docker Registry
------------------
Description: A Docker Registry is a storage and distribution system for Docker images. Docker Hub is the default public registry provided by Docker. There are also private registries, such as Docker Registry (open-source), or enterprise solutions like Docker Trusted Registry.

Operations: Registries handle pushing and pulling of images. When you build an image, you can push it to a registry so that it can be shared with others or used in different environments. Conversely, you can pull images from a registry to deploy them on into different environment.


NOTE: Registry contains collection of repositories.

we can manage these docker registry's by our self like nexus, Jfrog etc

Managed docker registories
===========================
ECR --> Elastic container registry(AWS)
ACR --> Azure container registry(Azure)
GCR --> Google container registry(GCP)

Docker repository --> we can maintain(Store) docker image with same name with different 		      tag(version)



