#! /bin/bash

/bin/bash /vagrant/configs/join.sh -v

sudo -i -u $USER bash << EOF
mkdir -p $HOME/.kube
sudo cp -i /vagrant/configs/config $HOME/.kube/
sudo chown 1000:1000 $HOME/.kube/config
NODENAME=$(hostname -s)
kubectl label node $(hostname -s) node-role.kubernetes.io/worker=worker-new
EOF