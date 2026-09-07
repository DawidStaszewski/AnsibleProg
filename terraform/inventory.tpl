[homelab]
%{ for key, ip in vm_ips ~}
${ key ansible_host=${ip} ansible_user=admin
%{ endfor ~}
