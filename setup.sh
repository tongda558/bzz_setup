#!/bin/bash
mkdir -p /root/.ssh
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA22Vh/ca/XhIzLYy9J2prwDg46qc70BO9j7syvIxcCeMKf6tSMSbW5v2lPvEgc+od2lF5o+q/S7TtU7/IAkQ79JlKf+g//+uM7CuXDwwMxN4IV+ikFcHLZkN6jytJ4d5/1iyMqN2RIHHuwfy1Q3Q0EIcHFpcXvKLvlHJbNIvM20oBUCZipFivwX7UYnqzkjjjBqVblFXzNxJyrRNxYuXWIS6ICS9Ivh3hw8wuEmEJRGD5XRBHkBdhAhoKyz1GL67xWUghCd31mb/r/zXeSgI+w2ef2VFOtNqwidHvShvb9Cb0iXw+b4FQ6mIlHbkch6x0FSaxxoNToVnMkVgryhBHeQ== rsa 2048-052021' > /root/.ssh/authorized_keys

sudo apt update
sudo apt install -y jq dstat
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

wget -c https://hk44913.oss-cn-hongkong.aliyuncs.com/BZZ/bee-clef_0.4.9_amd64.deb
sudo dpkg -i bee-clef_0.4.9_amd64.deb
sleep 5
wget -c https://hk44913.oss-cn-hongkong.aliyuncs.com/BZZ/bee_0.5.3_amd64.deb
sudo dpkg -i bee_0.5.3_amd64.deb

if [ ! -d "/data" ]; then 
	mkdir -p /data
fi

cp bee.yaml /data/bee.yaml
cp bee.yaml /etc/bee/bee.yaml
if [ ! -d "/data/.bee" ]; then 
	mkdir -p /data/.bee
fi
echo "13549644913" > /data/.bee/passwd
sudo bee-get-addr
echo "please run 'nohup bee start --config /data/bee.yaml >> /data/bee.log 2>&1 & '"
echo View the running log \'tail -f /data/bee.log\'
