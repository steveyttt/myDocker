#### info ####
* https://kubernetes.io/docs/tutorials/services/
* https://kubernetes.io/docs/concepts/services-networking/service/
* https://kubernetes.io/docs/concepts/services-networking/service/#nodeport
* [KubeDNS](https://github.com/kubernetes/dns/blob/master/docs/specification.md)
* [Core DNS](https://www.coredns.io/plugins/kubernetes/)
* A service is an exposed point for a POD
* Core DNS allows you to resolve service names
* There are different service types:
  * ClusterIP (Default) (Only allows internal kube comms from nodes and pods, not external)
    * Gets an internal VIP
  * NodePort
    * Node port also creates a Cluster IP
    * Works outside kube cluster using the kube hosts IP address
    * Port is open on every node
    * Anyone who can reach the host can connect
  * There are different load balancer types
    * Load balancer creates a ClusterIP & NodePort
    * You can use cloud provider port to load balance to a nodeport (AWS ALB etc)
    * With these lbs kube has plugins for different cloud providers (aws, azure etc). Kube will communicate with the vendors load balancer and update as needed.
    * Load balancer doesnt work on kubeadm, minikube or microk8s
  * External Name
    * Adds CNAME DNS records to core DNS
    * Not used for Pods, but for giving pods a DNS namefor something out of kubernetes
* Kubernetes Ingress


#### Services ####

#### Add a Cluster IP Service ####
```
kubectl create deployment httpenv --image=bretfisher/httpenv
kubectl scale deployment/httpenv --replicas 5
kubectl expose deployment/httpenv --port 8888
kubectl get service
kubectl run --generator=run-pod/v1 tmp-shell --rm -it --image=bretfisher/netshoot -- bash
curl httpenv:8888
```

#### Add a Node Port Service ####
```
kubectl expose deployment/httpenv --port 8888 --name httpenv-np --type NodePort
kubectl get services

NAME         TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
httpenv      ClusterIP   10.100.73.1     <none>        8888/TCP         70m
httpenv-np   NodePort    10.101.191.14   <none>        8888:30888/TCP   10s
kubernetes   ClusterIP   10.96.0.1       <none>        443/TCP          19h
```
* PORT(S) are displayed backwards in kubernetes I.E - container:host
* PORTS are set between 30000 - 32767 as "high ports" for kube hosts to use to LB requests

#### Add a Load balancer Service ####
```
kubectl expose deployment/httpenv --port 8888 --name httpenv-lb --type LoadBalancer
kubectl get service

NAME         TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
httpenv      ClusterIP      10.100.73.1      <none>        8888/TCP         84m
httpenv-lb   LoadBalancer   10.106.232.241   localhost     8888:32517/TCP   16s
httpenv-np   NodePort       10.101.191.14    <none>        8888:30888/TCP   14m
kubernetes   ClusterIP      10.96.0.1        <none>        443/TCP          19h
```
* This will now allow you to query any cluster IP on 8888 to hit the POD (see the EXTERNAL-IP column)