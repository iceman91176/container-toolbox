FROM alpine:3.11

RUN apk -v --update add \
        python3 \
        py-pip \
        groff \
        less \
        mailcap \
        mysql-client \
        curl \
        py-crcmod \
        bash \
        libc6-compat \
        gnupg \
        coreutils \        
        gzip \
        && \
    pip3 install --upgrade awscli s3cmd python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*

RUN mkdir /s3cfg

# Set Default Environment Variables
ENV TARGET_DATABASE_PORT=3306 REGION=US HOSTBASE=s3.amazonaws.com HOSTBUCKET=%(bucket)s.s3.amazonaws.com

COPY resources/perform-backup.sh /
COPY resources/s3-template.cfg /s3cfg/s3-template.cfg
RUN chmod +x /perform-backup.sh
CMD ["sh", "/perform-backup.sh"]
