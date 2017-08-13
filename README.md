# HAProxy Loadbalancing

```bash

> git clone git@github.com:manuthu/vagrant-haproxy-keepalived-loadbalancer.git

> vagrant up 

> vagrant ssh haproxy1

[vagrant@haproxy1 ~]$ ip addr show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
    link/ether 52:54:00:ad:a0:96 brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic eth0
       valid_lft 86299sec preferred_lft 86299sec
    inet6 fe80::5054:ff:fead:a096/64 scope link
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
    link/ether 08:00:27:78:02:f6 brd ff:ff:ff:ff:ff:ff
    inet 192.168.50.30/24 brd 192.168.50.255 scope global eth1
       valid_lft forever preferred_lft forever
    inet 192.168.50.100/32 scope global eth1
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fe78:2f6/64 scope link
       valid_lft forever preferred_lft forever

``` 
