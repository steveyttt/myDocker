#### Info
* [Kubernetes](https://kubernetes.io/) = container orchestrator
* [totorials](https://kubernetes.io/docs/tutorials/)
* Released in 2015 by google
* Can run [containerD](https://containerd.io/) or docker [cri-o](https://cri-o.io/#what-is-cri-o) (Or other container runtimes).
  * [Supported runtimes](https://kubernetes.io/docs/setup/production-environment/container-runtimes/)
* Run a lot with kubectl (Kube control)
* [Vendors](https://kubernetes.io/partners/#conformance) also make distribtutions of kubernetes
* Best to avoid the pure upstream version of kube, you can use it, but most people use a vendor specific one. However, check the vendors match the version of kube in github (Or one release behind) [github](https://github.com/kubernetes/kubernetes)
* Currently running v1.18
* Kube has a [Playground](https://www.katacoda.com/courses/kubernetes/playground)
* For local testing it is easiest to use docker desktop
* You can deploy with declarative YAML or with the CLI
* Handy logging tool [stern](https://github.com/wercker/stern)

#### Declarative vs Imperative
https://kubernetes.io/docs/concepts/overview/working-with-objects/object-management/  
https://kubernetes.io/docs/tasks/manage-kubernetes-objects/imperative-command/
https://kubernetes.io/docs/tasks/manage-kubernetes-objects/imperative-config/
https://kubernetes.io/docs/tasks/manage-kubernetes-objects/declarative-config/


#### Components
* Kubernetes is made up of many [components](https://kubernetes.io/docs/concepts/overview/components/#master-components)
* [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/) is the CLI to speak with the kube api - officially call it kube control
* nodes are the servers in the kube cluster
* kubelet is the kube agent running on the node

* control plane is in charge of the cluster (It is a set of containers), each service below runs as a unique container on each master.
  * etcD (Key,value backing store for kube)
  * api server(exposes the kube controlpane api)
  * scheduler (Assigns pods to nodes)
  * controller manager (manages nodecount, replica count & bridges services to pods )
  * coreDNS (managed DNS)
  * sometimes called MASTER (Masters run kube mgmt layer and nodes run containers)

* Nodes run simpler and only have two containers running at anyone time.
  * kubelet (Agent which runs on nodes, ensures containers are in pods)
  * kube-proxy (managed network connectivity)


#### Minikube
* Minikube [releases](https://github.com/kubernetes/minikube/releases/). Suitable if you have docker toolbox.
  * ```minikube implements a local Kubernetes cluster on macOS, Linux, and Windows. minikube's primary goals are to be the best tool for local Kubernetes application development and to support all Kubernetes features that fit.```


#### Microk8s
* [Microk8s](https://github.com/ubuntu/microk8s). Suitable if you have a running linux VM.
  * ```Single-package fully conformant lightweight Kubernetes that works on 42 flavours of Linux. Perfect for - Developer workstations, IoT, Edge, CI/CD```
  * uses snap to install kube
  * doesnt include docker runtime by default
  * Control things via ```microk8s``` cli commmands

#### Terminology
* [PODS](https://kubernetes.io/docs/concepts/workloads/pods/pod-overview/)
   ```
  A Pod is the basic execution unit of a Kubernetes application–the smallest and simplest unit in the Kubernetes object model that you create or deploy. A Pod represents processes running on your Cluster.
  
  A Pod encapsulates an application’s container (or, in some cases, multiple containers), storage resources, a unique network IP, and options that govern how the container(s) should run. A Pod represents a unit of deployment: a single instance of an application in Kubernetes, which might consist of either a single container or a small number of containers that are tightly coupled and that share resources.

  Docker is the most common container runtime used in a Kubernetes Pod, but Pods support other container runtimes as well.

  Pods in a Kubernetes cluster can be used in two main ways:

  Pods that run a single container. The “one-container-per-Pod” model is the most common Kubernetes use case; in this case, you can think of a Pod as a wrapper around a single container, and Kubernetes manages the Pods rather than the containers directly.

  Pods that run multiple containers that need to work together. A Pod might encapsulate an application composed of multiple co-located containers that are tightly coupled and need to share resources. These co-located containers might form a single cohesive unit of service–one container serving files from a shared volume to the public, while a separate “sidecar” container refreshes or updates those files. The Pod wraps these containers and storage resources together as a single manageable entity. The Kubernetes Blog has some additional information on Pod use cases.
  ```

* [CONTROLLER](https://kubernetes.io/docs/concepts/architecture/controller/)
  ```
  For creating & updating pods and other objects.
  Think deployment stes, replicasets, daemonsets, cronjobs
  ```

* [SERVICES](https://kubernetes.io/docs/concepts/services-networking/service/)
  * Think a network endpoint representing a group of pods
  ```
  In Kubernetes, a Service is an abstraction which defines a logical set of Pods and a policy by which to access them (sometimes this pattern is called a micro-service). The set of Pods targeted by a Service is usually determined by a selector (see below for why you might want a Service without a selector).
  ```


* [NAMESPACES](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/)
```
    Kubernetes supports multiple virtual clusters backed by the same physical cluster. These virtual clusters are called namespaces.

    Namespaces are intended for use in environments with many users spread across multiple teams, or projects. For clusters with a few to tens of users, you should not need to create or think about namespaces at all. Start using namespaces when you need the features they provide.

    Namespaces provide a scope for names. Names of resources need to be unique within a namespace, but not across namespaces. Namespaces can not be nested inside one another and each Kubernetes resource can only be in one namespace.

    Namespaces are a way to divide cluster resources between multiple users (via resource quota).

    In future versions of Kubernetes, objects in the same namespace will have the same access control policies by default.

    It is not necessary to use multiple namespaces just to separate slightly different resources, such as different versions of the same software: use labels to distinguish resources within the same namespace.

```