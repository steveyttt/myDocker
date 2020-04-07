#### Storage ####

* Stateful sets make PODS more sticky
* Avoid storage in Kube - use the cloud provider
* include a volume entry in your YAML
* Volumes can be local host storage or 3rd party storage [See volumes](https://kubernetes.io/docs/concepts/storage/volumes/)
* Volumes are tied to the lifecycle of a POD, all containers in a POD can use the volume
* Persistent volume claims are created at the cluster level, outlive a POD, can be shared by many PODS, usually created seperate to POD
* CSIs are the new way to connect to storage - CONTAINER STORAGE INTERFACE - they are plugins for how to connect to different storage vendors.

#### Handy URls ####
* [Persistent Volume Storage](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/)
* [Stateful sets](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/)
* [Volumes](https://kubernetes.io/docs/concepts/storage/volumes/)
* [Configuring MySql with persisten volumes](https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/)