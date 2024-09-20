systemctl disable --now ufw
apt update
apt install nfs-common open-iscsi -y
apt upgrade -y
curl -sfL https://get.rke2.io | INSTALL_RKE2_TYPE=agent sh -