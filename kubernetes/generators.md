#### info ####
* Think of them as templates or specifications for how to use run / expose / create style commands
  * They apply sane defaults to commands as needed or configured
* ```kubectl create deployment sample --image nginx --dry-run -o yaml```
  * ```--dry-run -o yaml``` dry run and put output to yaml, this can help you see all options.
  * You cant dry run based on a service that doesnt exist. I.E dry run an expose with no underlying running service / pods
* Generators carry opinionated defaults


#### Examples
```
kubectl create deployment test --image nginx --dry-run -o yaml
kubectl create jobs test --image nginx --dry-run -o yaml

kubectl create deployment test --image nginx
kubectl expose deployment/test --port 80 --dry-run -o yaml
```