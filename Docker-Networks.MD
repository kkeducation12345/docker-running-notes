
--> Intro of docker
--> Docker arch
--> docker workflow
--> Before docker ,  After docker
--> docker installations
--> docker images related commands 
--> docker container related commands
--> Dockerfile 
--> Docker best practices

--> docker networks
--> docker volumes
--> docker compose
----> k8s


Docker Networks
===============

--> Docker networks are used to establish communication between containers.
--> If both the containers are same network we can establish the connection.
--> If you are not mention any network, while creating a container, It will be created in "default bridge network".
--> By default docker have three networks

     1. bridge [default]
     2. host
     3. none

How to list a docker networks?
------------------------------

docker network ls

How to see the container is created in which network?
------------------------------------------------------

docker inspect <cid>


How to check both the containers are connected or not?
-------------------------------------------------------

step 0: create a two containers.

step 1: go inside the container one

docker exec -it mavenwebapp /bin/bash

step 2: ping with another container ip

ping 172.17.0.3

curl -v telnet://172.17.0.3:8080

NOTE: In default bridge network only ip's will work to connect another container not a container names.

Dis advantage of bridge n/w: If container restarted we are not guarantee to get same IP




IQ] what is the difference between default bridge network and custom bridge network?

Ans: Incase of default bridge network the communication can happen through only IP address. Where as in custom bridge network the communication can happen through the IP address/ container name.


How to create a network in docker?
----------------------------------------

Syntax: docker network create -d <driver> <networkname>

EX: docker network create -d bridge jionetwork
docker network ls

How IPs are allocating to container?
------------------------------------
docker inspect <network-name>

How to remove a unused networks?
--------------------------------

docker system prune or docker network prune  or docker network rm <nwtwork-name>


How to create a container in network?
-------------------------------------

docker run -d -p 8080:8080 --network jionetwork --name mavenwebapp kkeducation123456/maven-web-app:1.2

docker run -d -p 8081:8080 --network jionetwork --name javawebapp kkeducation123456/maven-web-app:1.2


docker exec -it javawebapp bash
ping mavenwebapp



=================================================================


NOTE: same container might part of another networks also.

How to add that container to another network?

docker network connect  jionetwork javawebappbridge

docker inspect javawebappbridge

---------------------------------

How to disconnect the container from network?

docker network disconnect  jionetwork javawebappbridge

docker inspect javawebappbridge


===================================================================


What is docker host network?
----------------------------

If we create container in host network, Container will not have an IP address.

NOTE: We can not create more than one container with same container port in the host network.

NOTE: you can not create custom host network like bridge


EX: docker run -d --network host --name javawebapp kkeducation123456/maven-web-app:1.2
    
     docker inspect 1ef68b5d5d80



What is none network?
---------------------

--> If you create containers in none network, Container will not have an IP address.
--> we can not access these containers from outside or from any containers or internally.



NOTE: The scope of the bridge/host/none with the docker server only, To overcome this problem we are using "overlay" network [multi host networks]

IQ] what is overlay network?

Establishing connection between containers in different docker servers.
