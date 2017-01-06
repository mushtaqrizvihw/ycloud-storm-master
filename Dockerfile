FROM mrizvi/ycloud-apps-base-master:0.1

RUN yum install -y storm; yum clean all
RUN yum install -y hadoop
ADD properties_file_to_yaml.sh /

# For the Storm UIs on all daemons, not really sure if this is needed or not.. added for debugging UI.. UI still doesn't work
EXPOSE 8080

## Gross hack to enable Slider agent running as nobody to go and replace files under the following directories.
RUN mkdir -p /etc/storm/conf && chmod -R a+w /etc/storm/conf
RUN mkdir -p /tmp/storm && chmod -R a+w /tmp/storm
RUN mkdir -p /usr/hdp/current/storm-nimbus/logs/ && chmod -R a+w /usr/hdp/current/storm-nimbus/logs/
