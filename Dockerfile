Dockerfile
==========

--> A Dockerfile is a text document containing a series of instructions on how to build a Docker image. It defines everything needed to create a containerized application, including the base image, the application code, and any necessary dependencies.

--> Docker runs these instructions from top to bottom 

--> These includes instructions like FROM,COPY, ADD, RUN, CMD, ENTRYPOINT, ARG, ENV, WORKDIR, EXPOSE, VOLUME,etc...

--> Instructions are not a case-sensitive , But use uppecase for better redability.

--> Default name of docker file is "Dockerfile"

Example:

FROM tomcat:8.0.21-jre8
COPY target/maven-web-application.war /usr/local/tomcat/webapps/maven-web-application.war
RUN echo "hello kk funda"



1. Base Image
-------------


FROM <image>:<tag>

--> Specifies the base image to use for the Docker image. 
--> This is the starting point from which your image is built. 
--> Common base images include official images for operating systems like Ubuntu or Alpine, or language-specific images like java or Node.js.



Example: FROM ubuntu:20.04


2. Maintainer (Optional)
------------------------


MAINTAINER <name> <email>

--> Provides information about the maintainer of the image. 
--> This instruction is now deprecated in favor of using LABEL, but it's still sometimes used in older Dockerfiles.


Example: MAINTAINER KK EDUCATION <kkeducationblr@gmail.com>


3. Labels (Metadata)
---------------------

LABEL <key>=<value> ...

Purpose: Adds metadata to the image in the form of key-value pairs. This can include information about the version, description, or any custom information you want to include.


Examples: 

LABEL version="1.0" description="A sample image"

LABEL company="KK EDUCATION"
LABEL mail="kkeducationblr@gmail.com"

NOTE: More than one LABEL will allow in image

4. Copy Files
-------------

COPY <src> <dest>

Purpose: Copies files or directories from the host machine to the image. The source path is relative to the build context (the directory containing the Dockerfile), and the destination path is inside the image.


Example: COPY target/mav
en-web-application.war /usr/local/tomcat/webapps/maven-web-application.war

         COPY . .
    
        COPY abc.tar /opt/



5. Add Files
------------

ADD <src> <dest>

Purpose: Similar to COPY, but with additional features like handling remote URLs and automatically extracting tar archives.


Example: ADD https://example.com/file.tar.gz /app/

         ADD abc.tar /opt/    -> untar 

6. RUN 
------
--> RUN instruction used to execute a commands/ scripts etc.
--> RUN instruction will be exuecuted while creating an image.
--> This instruction will be executed based on based image.
--> It can be executed in a two ways 1. shell form and 2. executable form.

use cases: 1. cretaing a directory
           2. execute a software
           3. unzip any zip file etc..
EX:
   shell form
   ----------
   RUN mkdir -p /opt/app
   RUN tar -xvzf /opt/apache-tomcat.tar.gz
   RUN useradd kkfunda
   RUN apt-get update && apt-get install git wget -y
   RUN ./setup.sh



   executable form
   ---------------
   RUN ["apt-get", "install", "-y", "vim"]
   RUN ["/bin/sh", "setup.sh"]
   RUN ["useradd","kkfunda"]

NOTE: please use shell form for RUN instructions, so we can replace variables easily.

7. CMD
------
--> CMD instruction used to execute a commands/ scripts etc.
--> CMD instruction will be exuecuted while creating a container.
--> This instruction will be executed based on based image.

EX:
   shell form
   ----------
   CMD sh app.sh
   CMD java -jar abc.jar

   executable form
   ---------------
   CMD ["sh", "app.sh"]
   CMD ["java", "-jar", "abc.jar"]


IQ] what is shell form and executable form in docker?

ANS:  RUN, CMD, ENTRYPOINT instructions can be defined in a shell form or executable form.

--> When we use shell form our command will be running as a "child process" under bash/sh (Shell)

  EX:  RUN java -jar app.jar

     --> In background above command will be executed as below
         
         /bin/sh -c java -jar app.jar
   [parent process]   [child process]

   NOTE: if you kill the parent process , It will not kill child process because some times child process connected 	 to DB.

   EX: RUN ["java", "-jar", "app.jar"]

     --> In background above command will be executed as below
      
         /bin/java -jar app.jar
         [parent process]

NOTE: when you are using CMD and ENTRYPOINT executable form is preferable.



IQ] what is the difference between RUN and CMD?

ANS:
  --> RUN instruction will be exuecuted while creating an image.
  --> CMD instruction will be exuecuted while creating a container.
  --> we have more than one RUN instruction in a Dockerfile. All the RUN instructions will be executed, while        	creating an image in the defined order (top to bottom).


CMD echo "one"
CMD echo "two"

IQ] can you have a more than one CMD in a Dockerfile?
 Ans: Yes you have, But only the last one/ recent one in the order will be executed while creating a container.

8. ENTRYPOINT
-------------

--> CMD instruction used to execute a commands/ scripts etc.
--> RUN instruction will be exuecuted while creating a container.
-->  ENTRYPOINT instruction used to execute a commands/ scripts etc.

EX: ENTRYPOINT java -jar app.jar  --> shell form

    ENTRYPOINT ["java", "-jar", "app.jar"]--> executable form


IQ] what is the difference between CMD and ENTRYPOINT?
ANS:

  --> CMD instructions are overriden while creating a container, But ENTRYPOINT instructions can't be overrriden while creating a container.
  --> Both the instructions are used to start our container.

IQ] can we keep both CMD and ENTRYPOINT instructions in a Dockerfile?

Ans: Yes, But CMD instructions will not be executed if both are present, CMD instructions will be passed as an argument to the ENTRYPOINT.

  EX: CMD ls
      ENTRYPOINT ["echo", "Hello"]

    --> It will be executed as below:
       
        /bin/echo Hello ls

       output: Hello ls

scenario: Our requirement always we have to execute sh catalina.sh, But argument by default it has to execute "start"

       Ex: CMD start
           ENTRYPOINT ["sh","catalina.sh"]

      /bin/sh catlina.sh start


CMD pwd
ENTRYPOINT ["echo","Hello"]

   /bin/echo Hello pwd



IQ] what is the difference between COPY and docker cp?

IQ] what is the difference between RUN and docker run?


===============================================================================================




Sample Docker File 1
---------------------

FROM debian:12.0
MAINTAINER KKFUNDA <kkeducationblr@gmail.com>
LABEL author="kkfunda"
LABEL email="kkeducationblr@gmail.com"
RUN echo "welcome to kkkfunda"
RUN apt update -y
RUN apt install git wget tree -y
RUN mkdir -p /opt/app
RUN echo "welcome to kk devops"

docker build -t firstimage .


IQ] My dockerfile contains more layers ? How to reduse it ?

Ans: you can use && operator to merge all RUN instruction.


IQ] what is docker build cahce?


IQ] what if we delete all the images and again build the docker file? what happens?


Ans:  





















IQ] what is docker build cache?

docker build -t firstimage .
docker build -t firstimage .
docker build -t firstimage .

--> add some instructions and build to see the cache 

IQ] How to skip the build cache?

 docker build --no-cache -t firstimage1 .



sample Docker file 2
---------------------

FROM debian:12.0
MAINTAINER KKFUNDA <kkeducationblr@gmail.com>
LABEL author="kkfunda"
LABEL email="kkeducationblr@gmail.com"
RUN echo "welcome to kkkfunda"
RUN apt update -y
RUN apt install git wget -y
RUN mkdir -p /opt/application
RUN echo "welcome to kk devops"

CMD ["date"]

 docker build -t firstimage1 .
 docker run --name firstc1 firstimage1

 docker start firstc1
 
 docker logs firstc1

sample Docker file 3
--------------------

FROM debian:12.0
MAINTAINER KKFUNDA <kkeducationblr@gmail.com>
LABEL author="kkfunda"
LABEL email="kkeducationblr@gmail.com"
RUN echo "welcome to kkkfunda"
RUN apt update -y
RUN apt install git wget -y
RUN mkdir -p /opt/application
RUN echo "welcome to kk devops"

CMD ["date"]

CMD ["echo","java"]


sample Docker file 4
---------------------

FROM debian:12.0
MAINTAINER KKFUNDA <kkeducationblr@gmail.com>
LABEL author="kkfunda"
LABEL email="kkeducationblr@gmail.com"
RUN echo "welcome to kkkfunda"
RUN apt update -y
RUN apt install git wget -y
RUN mkdir -p /opt/application
RUN echo "welcome to kk devops"

CMD sh test.sh

docker build -t imagetwo .  --> No error while building an image
docker run imagetwo  ---> sh: 0: cannot open test.sh: No such file


sample Docker file 5
--------------------

FROM debian:12.0
MAINTAINER KKFUNDA <kkeducationblr@gmail.com>
LABEL author="kkfunda"
LABEL email="kkeducationblr@gmail.com"
RUN echo "welcome to kkkfunda"
COPY test.sh test.sh
RUN apt update -y
RUN apt install git wget -y
RUN mkdir -p /opt/application
RUN echo "welcome to kk devops"

CMD sh test.sh



===============================================================================


sample Docker file 6
---------------------

FROM debian:12.0
MAINTAINER KKFUNDA <kkeducationblr@gmail.com>
LABEL author="kkfunda"
LABEL email="kkeducationblr@gmail.com"
RUN echo "welcome to kkkfunda"
COPY test.sh test.sh
RUN apt update -y
RUN apt install git wget -y
RUN mkdir -p /opt/application
RUN echo "welcome to kk devops"

ENTRYPOINT ["ls","-lrth"]


docker build -t imageone .
docker run imageone
docker run imageone date


sample dockerfile 7
-------------------

IQ] can we have a multiple ENTRYPOINT 's?


FROM debian:12.0
MAINTAINER KKFUNDA <kkeducationblr@gmail.com>
LABEL author="kkfunda"
LABEL email="kkeducationblr@gmail.com"
RUN echo "welcome to kkkfunda"
COPY test.sh test.sh
RUN apt update -y
RUN apt install git wget -y
RUN mkdir -p /opt/application
RUN echo "welcome to kk devops"

ENTRYPOINT ["ls","-lrth"]
ENTRYPOINT ["date"]


sample dockerfile 8
--------------------

IQ] can we have both CMD and ENTRYPOINT?

FROM debian:12.0
MAINTAINER KKFUNDA <kkeducationblr@gmail.com>
LABEL author="kkfunda"
LABEL email="kkeducationblr@gmail.com"
RUN echo "welcome to kkkfunda"
COPY test.sh test.sh
RUN apt update -y
RUN apt install git wget -y
RUN mkdir -p /opt/application
RUN echo "welcome to kk devops"

CMD ["pwd"]
ENTRYPOINT ["echo","Welcome"]


---> show the ngnix and jenkins Dockerfiles

==============================================================================================




9. ARG instruction
-------------------

-->Using the ARG we can define arguments for Dockerfile. we can use these in another instruction.

--> you can define multiple arguments in a Dockerfile

--> ARG the only instruction that may precede FROM in a Docker file.

--> ARG values are not available after building an image, i.e Running container won't access the ARG values.






EX: ARG branchName=development

    LABEL branch $branchName

--> while creating an image we can pass ARG as below

    ARG baseImageTag
    FROM debian:$baseImageTag

    docker build -t <imageName> --build-arg  baseImageTag=12.0 .



Example :

ARG baseImageTag
FROM debian:$baseImageTag
MAINTAINER KKFUNDA <kkeducationblr@gmail.com>
LABEL author="kkfunda"
LABEL email="kkeducationblr@gmail.com"
RUN echo "welcome to kkkfunda"
COPY test.sh test.sh
RUN apt update -y
RUN apt install git wget -y
RUN mkdir -p /opt/application
RUN echo "welcome to kk devops"

docker build -t <imageName> --build-arg  baseImageTag=12.0 .

docker build -t <imageName> --build-arg  baseImageTag=11.0 .


Ex:

ARG baseImageTag=latest
FROM debian:$baseImageTag


==============================================================================


10. ENV
----------

--> ENV is used to set an environment variables, The are available for image and container.

EX:
 
     ENV CATALINE_HOME /usr/local/tomcat
     ENV JAVA_HOME /usr/bin/jdk8


EX:

FROM debian:12.0
MAINTAINER KKFUNDA <kkeducationblr@gmail.com>
LABEL author="kkfunda"
LABEL email="kkeducationblr@gmail.com"
RUN echo "welcome to kkkfunda"
COPY test.sh test.sh
RUN apt update -y
RUN apt install git wget -y
RUN mkdir -p /opt/app

ENV HOME /opt/app
RUN echo $HOME

RUN echo "welcome to kk devops"










docker build -t imageone .

docker inspect imageone


===============================================================================


11. WORKDIR
------------

--> we can set working directory for an image/conatiner.
--> All sebsequent instructions will be processed under working directory.
--> It is working like cd command


EX: WORKDIR /usr/local/tomcat


EX:

FROM debian:12.0
MAINTAINER KKFUNDA <kkeducationblr@gmail.com>
LABEL author="kkfunda"
LABEL email="kkeducationblr@gmail.com"
RUN echo "welcome to kkkfunda"
COPY test.sh test.sh
WORKDIR /opt/app
RUN apt update -y
RUN apt install git wget -y
RUN mkdir -p /opt/app
RUN echo "welcome to kk devops"


12. USR
-------

--> USR is used to set user for the container or image

EX: 

RUN echo "hello"

RUN useradd kkdevops

RUN  

USER kkdevops

RUN echo "devops"

--> By default root user if you are not mention.

--> It is working as "su" command




COPY abc.py /opt/abc.py ---> RUN cp abc.py /opt/abc.py









================================================

13. EXPOSE
----------

--> expose indicates which port is opened/used in the image.

  EX: EXPOSE 8080




===========================================================================
Docker Best Practices
--------------------

1. Try to use offical images only to build your own images(custom images)

2. try to use alpine images as base images where its possible/available.

3. Don't copy/add  unnecessary files/folders which are not required,  size of image will increase.

   --> Don't install unnecessary softwares also

COPY . .

4. Try to redue the number of layers of an image as much as possible, By combining related 	commands to RUN instruction.

5. Use multi stage docker builds to reduse the size and number of layers of a image.

6. Try to run container as a non-root user.

7. Run a shell script to remove unused and dangling images on daily basis.


docker build

docker push 

docker run 

docker rmi <image_Name>

docker pull



















Docker file 1
-------------

FROM nginx:alpine
COPY index.html /usr/share/nginx/html
NOTE: create index.html in build context






Docker file 2
--------------

FROM openjdk:11-jdk
WORKDIR /app
COPY target/maven-standalone-application*.jar maven-standalone-application.jar 
CMD ["java","-jar","maven-standalone-application.jar"]







Docker file 3 --> alpine example
-------------

FROM alpine:latest
MAINTAINER KKFUNDA <kkeducationblr@gmail.com>
LABEL author="kkfunda"
LABEL email="kkeducationblr@gmail.com"
RUN echo "welcome to kkkfunda"
COPY test.sh test.sh
WORKDIR /opt/app
RUN apt update -y
RUN apt install git wget -y
RUN mkdir -p /opt/app

ENV HOME /opt/app
RUN echo $HOME

CMD ["echo","Hello"]

--------

FROM alpine:latest
MAINTAINER KKFUNDA <kkeducationblr@gmail.com>
LABEL author="kkfunda"
LABEL email="kkeducationblr@gmail.com"
RUN echo "welcome to kkkfunda"
COPY test.sh test.sh
RUN apk update
RUN apk add git wget
CMD ["sh","test.sh"]








Docker file 4 --> Dont copy unnecessary file
----------------

FROM tomcat:8.0.21-jre8
COPY target/maven-web-application.war /usr/local/tomcat/webapps/maven-web-application.war
COPY . .


IQ] what is .dockerignore   file?

Ans:













Docker file 5 --> Reduse the number of layers
-------------

FROM debian:12.0
MAINTAINER KKFUNDA <kkeducationblr@gmail.com>
LABEL author="kkfunda"
LABEL email="kkeducationblr@gmail.com"
RUN echo "welcome to kkkfunda"
COPY test.sh test.sh
WORKDIR /opt/app
RUN apt update -y
RUN apt install git wget -y
RUN mkdir -p /opt/app
RUN echo "welcome to kk devops"





Docker file 6 ---> Try to run as a normal user
-------------

# Use the official Tomcat image as the base image
FROM tomcat:9.0

# Create a new user and group
RUN groupadd -r myusergroup && \
    useradd -r -m -g myusergroup -s /bin/bash kkdevops

# Change ownership of Tomcat directories to the new user
RUN chown -R myuser:myusergroup /usr/local/tomcat && \
    chmod -R 755 /usr/local/tomcat

# Switch to the new user
USER kkdevops

# Optionally, add custom configuration or application files
# COPY ./my-app.war /usr/local/tomcat/webapps/

# Expose the port Tomcat runs on
EXPOSE 8080

# Set the default command to run Tomcat
CMD ["catalina.sh", "run"]

--------------

FROM test3:latest

# Switch to root user
USER root


Docker file 7  ---> Multi stage Docker file
--------------

FROM tomcat:8.5.41-jdk8
RUN apt install maven -y
WORKDIR /app
COPY . .
RUN mvn clean package
WORKDIR /usr/local/tomcat
RUN cp /app/target/maven-web-app*.war /usr/local/tomcat/maven-web-app.war



-----------

FROM maven:3.8.6-openjdk-8 as aaa
WORKDIR  /app
COPY . .
RUN mvn clean package

FROM tomcat:8.0.20-jre8
COPY --from=aaa /app/target/maven-web-app*.war /usr/local/tomcat/webapps/maven-web-app.war


==============================================


once we build image and mapped with container, then after some time we need to change or add instructions in docker file ,then we rebuild image after changes in docker file, again we need to create new container and map with that image?


Dockerfile

nexus.jio.com/jio_stage:1_0_1   --> jio


Dockerfile 

  nexus.jio.com/jio_stage:1_0_2---> jio_new

