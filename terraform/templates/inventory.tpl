[linux]
%{ for key, ip in linux_ip ~}
${key} ansible_host=${ip} ansible_user=admin
%{ endfor ~}

[windows]
%{ for key, ip in windows_ip ~}
${key} ansible_host=${ip}
%{ endfor ~}

[windows:vars]
ansible_connection=winrm
ansible_port=5986
ansible_winrm_transport=ntlm
ansible_winrm_server_cert_validation=ignore
ansible_user=Admin
ansible_password=Admin123!Strong
