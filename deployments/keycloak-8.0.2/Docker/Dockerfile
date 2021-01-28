FROM jboss/keycloak:8.0.2
MAINTAINER Carsten Buchberger <c.buchberger@witcom.de>
# User root user to install software
USER root
#Add CA-Trusts to System-Trust-Store
COPY ca-trust/*.crt /etc/pki/ca-trust/source/anchors/
RUN update-ca-trust

USER jboss
