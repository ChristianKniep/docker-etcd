###### ETCD images
# A docker image that includes
# - etcd
FROM qnib-supervisor
MAINTAINER "Christian Kniep <christian@qnib.org>"

### ETCD INST BELOW
ADD yum-cache/etcd /tmp/yum-cache/etcd
RUN yum install -y /tmp/yum-cache/etcd/qnib-etcd-0.3.0-20140423.2.x86_64.rpm
RUN rm -fr /tmp/yum-cache/etcd/
ADD etc/supervisord.d/etcd.ini /etc/supervisord.d/etcd.ini

