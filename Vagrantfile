# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "centos/7"

  # Configure the web server 1
  config.vm.define "webserver1" do |webserver1_config|
	webserver1_config.vm.provider :virtualbox do |vb_config|
		vb_config.name = "web server 1 - layer4-hap-web1"
	end
	webserver1_config.vm.hostname = "webserver1"
	webserver1_config.vm.network "private_network", ip: "192.168.50.10"
	webserver1_config.vm.provision :shell, path: "webserver.sh"
  end

  # Configure the web server 2
  config.vm.define "webserver2" do |webserver2_config|
	webserver2_config.vm.provider :virtualbox do |vb_config|
		vb_config.name = "web server 2 - layer4-hap-web2"
	end
	webserver2_config.vm.hostname = "webserver2"
	webserver2_config.vm.network "private_network", ip: "192.168.50.20"
	webserver2_config.vm.provision :shell, path: "webserver.sh"
  end

  # Configure the haproxy1 
  config.vm.define "haproxy1" do |haproxy1_config|
	haproxy1_config.vm.provider :virtualbox do |vb_config|
		vb_config.name = "HAProxy 1 - layer4-hap1-web"
	end
	haproxy1_config.vm.hostname = "haproxy1"
	haproxy1_config.vm.network "private_network", ip: "192.168.50.30"
	haproxy1_config.vm.network :forwarded_port, guest: 80, host: 8080
	haproxy1_config.vm.network :forwarded_port, guest: 9000, host: 9000 
	haproxy1_config.vm.provision :shell, path: "haproxy.sh"
	haproxy1_config.vm.provision :shell, inline: "cp /vagrant/keepalived.conf.master /etc/keepalived/keepalived.conf"
	haproxy1_config.vm.provision :shell, inline: "systemctl start keepalived"
  end

  # Configure the haproxy2
  config.vm.define "haproxy2" do |haproxy2_config|
	haproxy2_config.vm.provider :virtualbox do |vb_config|
		vb_config.name = "HAProxy 2 - layer4-hap2-web"
	end
	haproxy2_config.vm.hostname = "haproxy2"
	haproxy2_config.vm.network "private_network", ip: "192.168.50.40"
	haproxy2_config.vm.network :forwarded_port, guest: 80, host: 8082
	haproxy2_config.vm.network :forwarded_port, guest: 9000, host: 9092 
	haproxy2_config.vm.provision :shell, path: "haproxy.sh"
	haproxy2_config.vm.provision :shell, inline: "cp /vagrant/keepalived.conf.backup /etc/keepalived/keepalived.conf"
	haproxy2_config.vm.provision :shell, inline: "systemctl start keepalived"
  end
	

end
