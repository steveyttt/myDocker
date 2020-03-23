### Test versions of curl in different OS distributions

### CentOS  
Comes with version 7.29.0 by default
```
docker container run --rm --interactive --tty centos:7
yum update curl
curl --version
```

### Ubuntu
Comes with version 7.35.0 by default
```
docker container run --rm --interactive --tty ubuntu:14.04
apt-get update
apt-get install curl
curl --version
```