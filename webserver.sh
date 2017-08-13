echo "-- Installing nginx -\n"
yum install -y epel-release
yum install -y nginx

echo "Enable & start nginx ..."
systemctl enable nginx
systemctl start nginx
