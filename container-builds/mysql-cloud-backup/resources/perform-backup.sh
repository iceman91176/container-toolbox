#/bin/sh
sed "s/ACCESSKEY/$ACCESS_KEY/g;s/HOSTBASE/$HOSTBASE/g;s/HOSTBUCKET/$HOSTBUCKET/g;s/SECRET/$SECRET/g;s/REGION/$REGION/g;" /s3cfg/s3-template.cfg > /tmp/s3.cfg
while sleep 3600; do :; done
