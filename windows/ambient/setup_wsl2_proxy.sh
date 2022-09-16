# make sure clash-for-windows allow for LAN first


# set all proxy - using clash-for-windows (allow LAN)
host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
export ALL_PROXY="http://$host_ip:7890"
