Day 2 image related commands
============================

docker objects
===============

### Summary of Docker Objects

- **Containers**: Running instances of images.
- **Images**: Read-only templates used to create containers.
- **Volumes**: Persistent storage for container data.
- **Networks**: Facilitate communication between containers and with external systems.
- **Registries**: Storage and distribution points for images.
- **Dockerfile**: Defines how to build a Docker image.
- **Docker Compose**: Manages multi-container Docker applications.


=============================================================================

step 1: create a account in a docker hub

```
https://app.docker.com/signup
```

step 2: docker pull <imageName>:version
    
      ```docker pull tomcat
         docker pull centos
         docker pull jenkins/jenkins:lts
      ```


step 3: List the images

   ```  docker images 
      
        or 
  
       docker image ls
```

step 4: How to login to docker hub from CLI


``` docker login -u kkeducation123456 -p password

       or
docker login -u kkeducation123456 # press enter it will ask password
```


``` docker logout ```


``` docker rmi tomcat # delete the image
```

step 5: How to build an image ; pls make sure to write a docker file

   vi Dockerfile
   FROM tomcat:8.0.21-jre8

    docker build -t kkeducation123456/tomcat .

   docker tag tomcat:latest kkeducation123456/tomcat:latest --> for tag

   docker push kkeducation123456/tomcat:latest

step 6:

docker ps  #To see the running containers ---> 
docker ps -a  #To see the stoped and running container ---> 


docker run -d -p 8080:8080 --name tomcatapp  kkeducation123456/tomcat

http://ip:8080


step 7: 

docker info

docker inspect <image name>/image id  # inspect the image


step 8: How to list a layers of a image

docker histroy <imagenmae>/id


step 9:

    docker rmi -f <imagename>/id


step 10:

NOTE: if container is running we cant delete that image

docker stop <cname>/cid # used to stop the container




================


