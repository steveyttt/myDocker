#### Info
* Run me with ```kubectl apply -f filename.yaml```
* Run me with ```kubectl apply -f mydir/```
* Run me with ```kubectl apply -f https://myurl/file.yaml```
* Run me with ```kubectl apply -f file.yaml -l app=nginx``` (Only runs deployment on services labelled app=nginx)
* Delete me with ```kubectl delete -f myfile.yml ```

* yaml files contain one or more manifests
  * Each manifest describes an object (deployment, job, secret, pod, service)
  * Each manifest needs 4 parts (Key, Values)
    * apiVersion: (Version of api)
    * kind: (type - POD, SERVICE, DEPLOYMENT, etc)
    * metadata: (name and other info)
    * spec: (kind configuration)

#### Use the api docs when writing YAML:
* https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.18/
* Pay special attention to the KIND and API version

#### Dry Runs & Diffing deployments in kube
* https://kubernetes.io/blog/2019/01/14/apiserver-dry-run-and-kubectl-diff/

#### List of objects From Kube
* See that the command below provides a ```kind``` column. This is what you can reference in your YAML. These correspond to an api version which you can find below or by looking at kube api docs [here](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.18/)
```
kubectl api-resources

NAME                              SHORTNAMES   APIGROUP                       NAMESPACED   KIND
bindings                                                                      true         Binding
componentstatuses                 cs                                          false        ComponentStatus
configmaps                        cm                                          true         ConfigMap
endpoints                         ep                                          true         Endpoints
events                            ev                                          true         Event
limitranges                       limits                                      true         LimitRange
```

#### List of api versions 
```kubectl api-versions```  
* Lists the different versions of apis

#### list of values you can specify per resource in your YAML
* See below ```explain``` runs recursively
```
kubectl explain services --recursive
kubectl explain ${KIND} --recursive
kubectl explain Pod.spec.affinity
kubectl explain services.spec
kubectl explain services.spec.type
kubectl explain deployment.spec.template.spec.volumes.nfs.server
```

#### diff deployments before performing them
```kubectl diff -f ${yaml-file}```