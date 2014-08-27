###### ETCD images
# A docker image that includes
# - etcd
FROM qnib/terminal
MAINTAINER "Christian Kniep <christian@qnib.org>"

### ETCD INST
RUN echo "20140816.1"; yum clean all; yum install -y qnib-etcd
RUN mkdir -p /var/lib/etcd
ADD etc/supervisord.d/etcd.ini /etc/supervisord.d/etcd.ini
ADD root/bin/start_etcd.sh /root/bin/start_etcd.sh

EXPOSE 4001
EXPOSE 7001

CMD /bin/supervisord -c /etc/supervisord.conf
