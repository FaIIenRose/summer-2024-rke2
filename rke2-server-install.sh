systemctl disable --now ufw
apt update
apt install nfs-common open-iscsi -y
apt upgrade -y
curl -sfL https://get.rke2.io | INSTALL_RKE2_TYPE=server sh -
systemctl enable rke2-server.service
systemctl start rke2-server.service
systemctl status rke2-server.service