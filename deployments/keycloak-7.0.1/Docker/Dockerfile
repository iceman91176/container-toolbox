FROM jboss/keycloak:7.0.1
MAINTAINER Carsten Buchberger <c.buchberger@witcom.de>
# User root user to install software
USER root
#Add CA-Trusts to System-Trust-Store
COPY ca-trust/*.crt /etc/pki/ca-trust/source/anchors/
RUN update-ca-trust

USER jboss
