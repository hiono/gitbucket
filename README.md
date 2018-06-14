# gitbucket

Setup a container with GitBucket installed.

# Usage
To run the container, do the following:

    % docker run -d -p 8080:8080 -p 29418:29418 -v ${PWD}/data:/var/gitbucket lightszentip/gitbucket

You can see gitbucket running on 
You also see gitbucket data write out to "./data".

In order to access the git repository over SSH (port 29418), check settings below.

  - GitBucket > Administration > System Settings > SSH access

# Dockerfile

To generate the Dockerfile, do the following:

    % make all

# Building

To build the image, do the following:

    % docker build github.com/lightszentip/gitbucket

A prebuilt container is available in the docker index.

    % docker pull lightszentip/gitbucket

# GitBucket's license

see https://github.com/takezoe/gitbucket

# Image

[![](https://images.microbadger.com/badges/image/lightszentip/gitbucket.svg)](https://microbadger.com/images/lightszentip/gitbucket "Get your own image badge on microbadger.com")
