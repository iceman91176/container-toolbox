FROM centos/nginx-112-centos7:latest
MAINTAINER The CentOS Project <cloud-ops@centos.org>

# Labels consumed by Red Hat build service
LABEL Component="nginx" \
      Name="nginx-angular-runtime" \
      Version="1.8.0" \
      Release="1"

# Labels could be consumed by OpenShift
LABEL io.k8s.description="nginx angular-runtime" \
      io.k8s.display-name="nginx 1.8.0" \
      io.openshift.expose-services="80:http" \
      io.openshift.tags="nginx"

USER root:root
ADD config/nginx.conf /etc/

