## Build me with:
##  docker build -t img_from .
##          -t = tag or name the image
##          . = build using the Dockerfile in the local directory

##  Once built you can check it exists by running
##  docker images

##Set an arg that can be called as a variable later
ARG CODE_VERSION=16.04
##MANDATORY## From specified the source image
FROM ubuntu:${CODE_VERSION} 
##Command to run when the image is built
RUN apt-get update -y