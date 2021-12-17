Vagrant.configure("2") do |config|
    config.vm.provision "shell", inline: <<-SHELL
        apt-get update -y
        echo "10.0.0.10  master-node" >> /etc/hosts
        echo "10.0.0.11  worker-node01" >> /etc/hosts
        echo "10.0.0.12  worker-node02" >> /etc/hosts
    SHELL
    
    config.vm.define "master" do |master|
      master.vm.box = "bento/ubuntu-18.04"
      master.vm.hostname = "master-node"
      master.vm.network "private_network", ip: "10.0.0.10"
      master.vm.network "forwarded_port", id: "ssh", host: 1110, guest: 22
      master.vm.synced_folder ".", "/vagrant"
      master.vm.provider "virtualbox" do |vb|
          vb.memory = 2048
          vb.cpus = 2
      end
      master.vm.provision "shell", path: "scripts/common.sh"
      master.vm.provision "shell", path: "scripts/master.sh"
      master.vm.provision "shell", inline: <<-SHELL
        ## add user
        user=adel-youcef-mecheref
        useradd -m -s /bin/bash -U $user -u 666 --groups sudo
        cp -pr /home/vagrant/.ssh /home/$user/
        chown -R $user:$user /home/$user
        echo "%$user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$user
        ## k8s config
        mkdir -p /home/$user/.kube
        sudo cp -i /vagrant/configs/config /home/$user/.kube/
        sudo chown 666:666 /home/$user/.kube/config
      SHELL
    end

  
    config.vm.define "node01" do |node|
      node.vm.box = "bento/ubuntu-18.04"
      node.vm.hostname = "worker-node01"
      node.vm.network "private_network", ip: "10.0.0.11"
      node.vm.network "forwarded_port", id: "ssh", host: 1111, guest: 22
      node.vm.synced_folder ".", "/vagrant"
      node.vm.provider "virtualbox" do |vb|
          vb.memory = 1024
          vb.cpus = 1
      end
      node.vm.provision "shell", path: "scripts/common.sh"
      node.vm.provision "shell", path: "scripts/node.sh"
      node.vm.provision "shell", inline: <<-SHELL
        ## add user
        user=assia-ouali
        useradd -m -s /bin/bash -U $user -u 666 --groups sudo
        cp -pr /home/vagrant/.ssh /home/$user/
        chown -R $user:$user /home/$user
        echo "%$user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$user
        ## k8s config
        mkdir -p /home/$user/.kube
        sudo cp -i /vagrant/configs/config /home/$user/.kube/
        sudo chown 666:666 /home/$user/.kube/config
      SHELL
    end

    config.vm.define "node02" do |node|
      node.vm.box = "bento/ubuntu-18.04"
      node.vm.hostname = "worker-node02"
      node.vm.network "private_network", ip: "10.0.0.12"
      node.vm.network "forwarded_port", id: "ssh", host: 1112, guest: 22
      node.vm.synced_folder ".", "/vagrant"
      node.vm.provider "virtualbox" do |vb|
          vb.memory = 1024
          vb.cpus = 1
      end
      node.vm.provision "shell", path: "scripts/common.sh"
      node.vm.provision "shell", path: "scripts/node.sh"
      node.vm.provision "shell", inline: <<-SHELL
        ## add user
        user=belkacemi-hichem
        useradd -m -s /bin/bash -U $user -u 666 --groups sudo
        cp -pr /home/vagrant/.ssh /home/$user/
        chown -R $user:$user /home/$user
        echo "%$user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$user
        ## k8s config
        mkdir -p /home/$user/.kube
        sudo cp -i /vagrant/configs/config /home/$user/.kube/
        sudo chown 666:666 /home/$user/.kube/config
      SHELL
    end
    
  end
