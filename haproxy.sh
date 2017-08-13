echo "--------------------"
echo "Installing HAProxy"
echo "--------------------"
yum install -y haproxy

echo "Configure HAProxy Logging (rsyslog)"
sed -i 's/\#\$ModLoad imudp/\$ModLoad imudp/' /etc/rsyslog.conf
sed -i 's/\#\$UDPServerRun 514/\$UDPServerRun 514/' /etc/rsyslog.conf
echo "local2.* /var/log/haproxy.log" > /etc/rsyslog.d/haproxy.conf
systemctl restart rsyslog

cat > /etc/haproxy/haproxy.cfg <<EOF
global
	log         127.0.0.1 local2

	chroot      /var/lib/haproxy
	pidfile     /var/run/haproxy.pid
	maxconn     4000
	user        haproxy
	group       haproxy
	daemon

	# turn on stats unix socket
	stats socket /var/lib/haproxy/stats level admin

defaults
	mode                    http
	log                     global
	option                  httplog
	option                  dontlognull
	option http-server-close
	option forwardfor       except 127.0.0.0/8
	option                  redispatch
	retries                 3
	timeout http-request    10s
	timeout queue           1m
	timeout connect         10s
	timeout client          1m
	timeout server          1m
	timeout http-keep-alive 10s
	timeout check           10s
	maxconn                 3000

frontend  http *:80
	default_backend             web

backend web
	balance roundrobin
	server  webserver1 192.168.50.10:80 check inter 500 fail 3 rise 2
	server  webserver2 192.168.50.20:80 check inter 500 fail 3 rise 2

# Configure statistics page
listen stats :9000
	mode http
	stats enable
	stats hide-version
	stats realm HAproxy\ Statistics
	stats uri /stats
	stats auth admin:admin
EOF

systemctl enable haproxy
systemctl start haproxy


echo "Installing keepalived"
yum install -y keepalived
systemctl enable keepalived
