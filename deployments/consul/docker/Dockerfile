FROM consul:1.4.4
MAINTAINER WiTCOM <c.buchberger@witcom.de>

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chgrp -R 0 /consul && \
    chmod -R g=u /consul && \
    chmod 755 /usr/local/bin/docker-entrypoint.sh		


ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["agent", "-dev", "-client", "0.0.0.0"]
