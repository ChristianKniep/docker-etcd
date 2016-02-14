###### ETCD images
FROM qnib/terminal

### ETCD INST
RUN dnf install -y etcd
RUN mkdir -p /var/lib/etcd
ADD etc/supervisord.d/etcd.ini /etc/supervisord.d/etcd.ini
ADD root/bin/start_etcd.sh /root/bin/start_etcd.sh
