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



