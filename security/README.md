
#### Handy URLs ####
* [Security recommendations for Docker on Linux servers, in order of priority.](https://github.com/BretFisher/ama/issues/17)
* [Scan with docker bench](https://github.com/docker/docker-bench-security)
* [Use multi stage builds](https://docs.docker.com/develop/develop-images/multistage-build/)
* [Use a runtime security tool](https://sysdig.com/opensource/falco/)

* [Compare all docker secuity tools](https://sysdig.com/blog/20-docker-security-tools/)
* [Docker docs on security](https://docs.docker.com/engine/security/security/)
* [Docker bench](https://github.com/docker/docker-bench-security)
* [CIS Benchmark](https://www.cisecurity.org/benchmark/docker/)

#### Name Spaces ####
- used to block visibility and scope of different applications and users. Creates isolation.

#### Control groups ####
- limits the resources assigned to a container

#### Dont run as root ####
- [Docker Hub user reference](https://docs.docker.com/engine/reference/builder/#user)
- Example of chown and using a custom USER in a [dockerfile](https://github.com/BretFisher/dockercon19/blob/master/1.Dockerfile)

#### Scanning tools ####
* [aqua security - Trivy](https://github.com/aquasecurity/trivy)
* [Twist Lock](https://www.twistlock.com/resources/shift-left-security/)
* [Snyk](https://snyk.io/)
* [CVE - publicly known cyber security vulnerabilities](https://cve.mitre.org/)


#### APP armour & SecComp
* [App Armour](https://docs.docker.com/engine/security/apparmor/)
* ```AppArmor (Application Armor) is a Linux security module that protects an operating system and its applications from security threats.```
* [SecComp](https://docs.docker.com/engine/security/seccomp/)
* ```Secure computing mode (seccomp) is a Linux kernel feature. You can use it to restrict the actions available within the container.```

#### Sensible list of security techniques ####
1. Use secure or official images
2. Patch your containers
3. Use private or trusted repos
4. Sign your images
5. Use docker bench or hadolint to lint your Dockerfile
6. Secure your host
7. Do not run you app as root
8. Do not expose ports you dont need to
9. Use control groups to limit resource consumotion
10. Scan your images with coreOS clair
11. Scan your images with nexus IQ / CLI
12. Scan your bespoke code with veracode / sonaqube
13. use a runtime tool on your host and container (i.e. Falco)
14. Use kernel capabilities (i.e. run containers with redaonly file systems)
15. Build according to the Docker CIS benchmark
16. Enable user namespaces
