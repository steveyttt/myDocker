#### Info
* hub.docker.com is a basic image REPO which has some basic image building capabilities
    * You can craete REPOs
    * configure permissions, tags
    * Set webhooks on image push
    * link to github or bitbucket. 
        * You can link your github REPO to hub.docker REPO and commits in github will create images inside hub.docker for you.
        * You can select which branches to create images on
        * You can also set repository links. All images contain a ```FROM``` statement. If the base image in your ```FROM``` statement changes you can configure your custom image to auto rebuild too.
        * You can also enable triggers which gives you a URL you can hit in hub.docker with a POST request and that will trigger a new image build for that REPO.
* [Docker private registry (official)](https://github.com/docker/distribution)
* ```docker pull registry```
  * No web UI
  * Basic Auth
  * Some certs
  * written in go
  * Can be backed by S3, GCS, Blob
  * [Configure here](https://docs.docker.com/registry/configuration/)
  * [Garbage COllection here](https://docs.docker.com/registry/garbage-collection/)
  * [Registry as a pull through cache (local mirror)](https://docs.docker.com/registry/recipes/mirror/)
* Defaultport 5000
* Secure by default with TLS HTTPS
* If you run on localhost 127.0.0.1 you can use plain text traffic
* You can use insecure-registry with a self signe cert

* There is a lab called ["Creating a secured linux registry"](https://training.play-with-docker.com/linux-registry-part2/)

* You can query a registry to get catalog (there are many api queries):
  * ```curl localhost:5000/v2/_catalog```

* Lists of great registries are:
  * http://quay.io/
  * https://aws.amazon.com/ecr/
  * https://azure.microsoft.com/en-us/services/container-registry/
  * https://cloud.google.com/container-registry/
  


#### Spin up the registry ####
```
docker container run -d -p 5000:5000 --name registry registry
docker pull hello-world
docker tag hello-world 127.0.0.1:5000/hello-world
docker push 127.0.0.1:5000/hello-world
docker image remove hello-world
docker image remove 127.0.0.1:5000/hello-world
docker pull 127.0.0.1:5000/hello-world
curl localhost:5000/v2/_catalog
```

#### Spin up a registry with custom volumes for storage ####
```docker container run -d -p 5000:5000 --name registry -v $(pwd)/registry-data:/var/lib/registry registry```

#### Do it in swarm
```docker service create --name registry --publish 5000:5000 registry```