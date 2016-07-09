ssh compute1 'echo "#Odx942#"|sudo -S cp /etc/nova/nova.conf.14 /etc/nova/nova.conf && sudo -S service nova-compute restart'  
ssh compute2 'echo "#Odx942#"|sudo -S cp /etc/nova/nova.conf.14 /etc/nova/nova.conf && sudo -S service nova-compute restart' 
ssh compute3 'echo "#Odx942#"|sudo -S cp /etc/nova/nova.conf.14 /etc/nova/nova.conf && sudo -S service nova-compute restart' 
