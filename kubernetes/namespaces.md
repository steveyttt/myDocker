* like virtual clusters in a physical cluster
* Kube namespaces are not related to docker namespaces
* Can set auth on different name spaces and clusters. Think RBAC.
* Not really needed in small clusters
* ```kubectl get namespaces```
* ```kubectl get all --all-namespaces```
* ~/.kube/config - yaml file which sets defaults for kube cluster, auth and name spaces
* ```kubectl config get-contexts```
* ```kubectl config set*```
* 