# gitbucket

Setup a container with GitBucket installed.

# Usage
To run the container, do the following:

    % docker run -d -p 8080:8080 -p 29418:29418 -v ${PWD}/data:/gitbucket hiono/gitbucket

You can see gitbucket running on 
You also see gitbucket data write out to "./data".

In order to access the git repository over SSH (port 29418), check settings below.

  - GitBucket > Administration > System Settings > SSH access

# Building

To build the image, do the following:

    % docker build github.com/hiono/docker-gitbucket

A prebuilt container is available in the docker index.

    % docker pull hiono/gitbucket

# GitBucket's license

see https://github.com/takezoe/gitbucket
