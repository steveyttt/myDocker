### Raw notes
* Official images in dockerhub have no / in their name (i.e. steveyttt/nginx). The official nginx image is just called nginx for example.
* Images are tagged, tags are accessed with the character ':' i.e. nginx:1.11.9-alpine
* If you specify no tag it defaults to latest
* You get a REPO per image
* Dont use latest tag for PROD deployments
* Images use the union file system

### Docker file reference
Located [here](https://docs.docker.com/engine/reference/builder/)

### Docker ignore  
Use docker ignore to ignore certain file types when building images
[Docker ignore](https://docs.docker.com/engine/reference/builder/#dockerignore-file)
### Good NodeJS defaults
[Here](https://github.com/BretFisher/node-docker-good-defaults)

### Image caching
* layers are created inside an image with different steps inside a docker file (run, copy, etc)
* Each layer is cached on the local host and a unique SHA is created for every layer of an image
* This allows builds to happen quickly which share common layers
* caching works for creating, pushing and pulling images!

### Building image best practices
* Keep the things that change the LEAST at the TOP of your Dockerfile
* Keep the things that change the MOST at the BOTTOM of your Dockerfile
* This is so you can take advantage of CACHING effectively
* Use ```workdir``` not ```cd ${directory}```

### Official docker images:
[Official DockerHub Images](https://github.com/docker-library/official-images/tree/master/library)
[DockerHub library](https://github.com/docker-library)

### Pull an image with a tag:
```docker pull nginx:1.11.9-alpine```

### Delete an image
```docker image rm -f ${Image name}```

### See the history of the image layers (How they were created)
```docker history nginx:latest```

### Inspect an image for metadata (cmd, env vars, labels, arch, os, volumes, ports)
```docker image inspect nginx:latest```

### tag an image
```docker image tag ${Source Image} ${New Image}```   
i.e.  
```docker image tag nginx:1.17-alpine steveyttt/nginx:1.17-alpine```

### Login to hub.docker.com (prior to a push)
```docker login```

### Push an image (Login first)
```docker push steveyttt/nginx```

### Build an image from a local Dockerfile with a specific tag
```docker image build -t ${user}/${repo}:${tag} .```  
i.e.  
```docker image build -t steveyttt/nginx:jessie .```