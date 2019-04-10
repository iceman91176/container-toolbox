# Kubernetes ZooKeeper K8SZK
This project contains a Docker image meant to facilitate the deployment of 
[Apache ZooKeeper](https://zookeeper.apache.org/) on [Kubernetes](http://kubernetes.io/) using 
[StatefulSets](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/). 

## Limitations
1. Scaling is not currently supported. An ensemble's membership can not be updated in a safe way 
in ZooKeeper 3.4.10 (The current stable release).
2. Observers are currently not supported. Contributions are welcome.
3. Persistent Volumes must be used. emptyDirs will likely result in a loss of data.

## Docker Image
The docker image contained in this repository is comprised of a base Ubuntu 16.04 image using the latest
release of the OpenJDK JRE based on the 1.8 JVM (JDK 8u111) and the latest stable release of 
ZooKeeper, 3.4.10. Ubuntu is a much larger image than BusyBox or Alpine, but these images contain
mucl or ulibc. This requires a custom version of OpenJDK to be built against a libc runtime other 
than glibc. No vendor of the ZooKeeper software supplies or verifies the software against such a 
JVM, and, while Alpine or BusyBox would provide smaller images, we have prioritized a well known 
environment.

The image is built such that the ZooKeeper process is designated to run as a non-root user. By default, 
this user is zookeeper. The ZooKeeper package is installed into the /opt/zookeeper directory, all 
configuration is sym linked into the /usr/etc/zookeeper/, and all executables are sym linked into 
/usr/bin. The ZooKeeper data directories are contained in /var/lib/zookeeper. This is identical to 
the RPM distribution that users should be familiar with.

## Building Docker
Container can be built and pushed with 
```make```

## Building with Openshift

Create new build with

oc new-build https://github.com/iceman91176/container-toolbox --context-dir='/deployments/zookeeper' --labels='app=zookeeper' --name='zookeeper'

Use built image in statefulset.

