#### Overlay Network ####
* An overlay network is a type of network that is created for all nodes in a cluster to communicate over
* for intra cluster communication (within the cluster)
* Can leverage IPSec to encrypt communication (it has a performance impact though)

#### Routing Mesh ####
* Routes ingress packets for a service to a proper task
* Spans all nodes in swarm
* Uses IPVS from Linux Kernel
* load balances requests across their tasks
* Runs in 2 ways:
    * container to container (using a VIP) in front of all services
    * external traffic coming into your swarm

* A VIP sits in front of a service in swarm. i.e. if you create an NGINX service with 3 task replicas you would have:
    * Nginx 1 IP 10.10.10.5
    * Nginx 2 IP 10.10.10.10
    * Nginx 3 IP 10.10.10.15
    * Nginx VIP IP 10.10.10.20 (Which front the .5 .10 & .15 address)
* All traffic for the service is aimed at the VIP and that routes to the NGINX tasks

* routing mesh is STATELESS using the default VIP
* It is layer 3 (Port and IP) no layer 4 (DNS, header, query string, method)
* you can leverage NGINX or HA proxy INSIDE the swarm to act as your load balancer to other services. This woudl allow you to perform layer 4 activites. You could also front with an ALB.
* Docker datacenter / enterprise comes with a built in L4 ingress proxy

#### 
* As with normal docker daemon, containers can resolve containers based on service names
* If you need to use custom DNS you can run the --dns command
    * With custom DNS you can still resolve local containers by service name