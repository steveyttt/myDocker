#### How to create a DNS alias for your containers  
Create 2 elastic search nodes with a DNS alias in docker, then resolve the alias using alpine sh and CentOS curl  
```
docker container run --network my_own_network --detach --network-alias search elasticsearch:2
docker container run --network my_own_network --detach --network-alias search elasticsearch:2
docker container run --network my_own_network --rm alpine nslookup search
docker container run --network my_own_network --rm centos:7 curl -s search:9200
```