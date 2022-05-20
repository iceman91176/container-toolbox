FROM jboss/keycloak:12.0.4
MAINTAINER Carsten Buchberger <c.buchberger@witcom.de>
# User root user to install software
USER root
#Add CA-Trusts to System-Trust-Store
COPY ca-trust/*.crt /etc/pki/ca-trust/source/anchors/
RUN update-ca-trust

USER jboss
