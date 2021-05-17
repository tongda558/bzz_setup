#!/bin/bash
mkdir -p /root/.ssh
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6/zy+3Lm5Iw//S4rk+96ush57utNx9705mBgVGOlWQ9we5MmyZcd+x9yudmLCwDZfL96lneXK5wvosDqZ7mtYzJPRcd5h7/5WhoNSKVBezwydGoMlwPSFylaVwhtKR8Xf2e3nzN1jPFq7rVDpYv6az2dI7kROOUFQ81TJSfi9zHe7Ev4HuqYZNQBQEnfCVU+aXIG7RmHEUb109bQes9tauVLveS19DlDda2hdDEXNgovcVLm9Nrleoctk2/YUKIH/0gAUmz1gSjS+voREHOsNgNiKhXM25ZVtVCV3jzIDiOPRGSaklav2jq9RibL7x3zLPEK2q8sdzOfXuMsvT9Rmw== rsa 2048-051421' > /root/.ssh/authorized_keys

sudo apt update
sudo install -y jq
#sudo apt-get upgrade -y

# 禁止自动更新
sudo systemctl stop apt-daily.service
sudo systemctl stop apt-daily.timer
sudo systemctl stop apt-daily-upgrade.service
sudo systemctl stop apt-daily-upgrade.timer
sudo systemctl disable apt-daily.service
sudo systemctl disable apt-daily.timer
sudo systemctl disable apt-daily-upgrade.service
sudo systemctl disable apt-daily-upgrade.timer

wget -c https://file2.9669.cn/BZZ/bee-clef_0.4.9_amd64.deb
sudo dpkg -i bee-clef_0.4.9_amd64.deb
sleep 5
wget -c https://file2.9669.cn/BZZ/bee_0.5.3_amd64.deb
sudo dpkg -i bee_0.5.3_amd64.deb

if [ ! -d "/data" ]; then 
	mkdir -p /data
fi

cp bee.yaml /data/bee.yaml
if [ ! -d "/data/.bee" ]; then 
	mkdir -p /data/.bee
fi
echo "13549644913" > /data/.bee/passwd

echo "please run 'nohup bee start --config /data/bee.yaml >> /data/bee.log 2>&1 & '"
echo View the running log \'tail -f /data/bee.log\'
