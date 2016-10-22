#!/bin/bash

TARGET="/var/vcap/packages/logstash/vendor/bundle/jruby/1.9/gems/logstash-output-s3-2.0.7/lib/logstash/outputs/s3.rb"
PATCH="/var/vcap/jobs/apply-patch/config/s3.patch"
while [ ! -f $TARGET ] ; do
    sleep 1
done

/usr/bin/patch -N $TARGET $PATCH | tee /var/vcap/sys/log/apply-patch/output.log

exit 0
