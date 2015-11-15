###### ETCD images
# - etcd
FROM qnib/terminal

### ETCD INST
RUN echo "2015-11-15.1"; yum clean all; yum install -y etcd
RUN mkdir -p /var/lib/etcd
ADD etc/supervisord.d/etcd.ini /etc/supervisord.d/etcd.ini
ADD root/bin/start_etcd.sh /root/bin/start_etcd.sh

CMD /bin/supervisord -c /etc/supervisord.conf
