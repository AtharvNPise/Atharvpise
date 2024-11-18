sudo dnf check-update
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl status docker
sudo systemctl enable docker
sudo usermod -aG docker dhpcsa
docker ps -a
sudo chown -R dhpcsa /var/run/docker.sock 
docker ps -a
clear
echo "######### This script will install Kubernetes #############
echo "#### Common Installation script ######"
echo "##### Execute on Manager and worker nodes also ####"
sleep 5 
###Enable br_netfilter kernel module
sudo tee /etc/modules-load.d/containerd.conf <<EOF
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

sudo sysctl --system
###Disable Swap 
sudo swapoff -a
###remove swap entry from /etc/fstab
sudo sed -i '/swap/d' /etc/fstab
###Install containerd runtime 
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install containerd.io -y
sudo containerd config default | sudo tee /etc/containerd/config.toml >/dev/null 2>&1
sudo sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml
sudo systemctl restart containerd
sudo systemctl enable containerd
sudo systemctl status containerd &> /dev/null
###Add kubernetes repository
cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/repodata/repomd.xml.key
exclude=kubelet kubeadm kubectl cri-tools kubernetes-cni
EOF

sudo yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
##start and enable kubelet service
sudo systemctl enable --now kubelet
sudo systemctl enable kubelet
echo "#######Installation completed successfully #####"
ifconfig 
sudo hostnamectl set-hostname worker-2
sudo hostname worker-2
exit
sudo vi /etc/hosts
sudo firewall-cmd --permanent --add-port={179,10250,30000-32767}/tcp
sudo firewall-cmd --permanent --add-port=4789/udp
sudo firewall-cmd --reload
cat token-kube 
sudo kubeadm join 192.168.56.101:6443 --token q3gzlc.zasjet1zz7w7e2q4 --discovery-token-ca-cert-hash sha256:6731c27eb942b6750ac06d9b5de39ca3ca3c2e58492897958ca51390fa1ff7ad 
sudo init 0
sudo dnf check-update
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl status docker
sudo systemctl enable docker
sudo usermod -aG docker dhpcsa
docker ps -a
clea
clear
sudo yum update -y
sudo yum install java-17-openjdk.x86_64 -y
sudo wget -O /etc/yum.repos.d/jenkins.repo     https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
# Add required dependencies for the jenkins package
sudo yum install fontconfig java-17-openjdk
sudo yum install jenkins
sudo systemctl daemon-reload
sudo systemctl daemon-reload 
sudo systemctl start jenkins
sudo systemctl eable jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins
sudo firewall-cmd --add-port=8080/tcp
sudo firewall-cmd --add-port=8080/tcp --permanent 
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
dnf install git -y
sudo dnf install git -y
docker -version
docker --version
sudo hostnamectl set-hostname LinuxVm
sudo hostname LinuxVm
