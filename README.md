# bzz_setup

#### 基于Ubuntu 18.04.5 系统,一键初始化脚本,数据盘挂载到 /data 目录

```
apt update -y && apt install -y git && \
git clone https://github.9669.cn/tongda558/bzz_setup.git && cd bzz_setup && bash setup.sh
```

### 后台运行
```
nohup bee start --config /data/bee.yaml > /data/bee.log 2>&1 &
```
### 查看运行日志
```
tail -f /data/bee.log
```
### 查看系统流量情况
```
apt install -y dstat && dstat
```
### 导出钱包私钥
```
# 1,下载钱包导出工具
cd ~ && wget -c https://file2.9669.cn/BZZ/export-swarm-key-linux-amd64 && chmod 755 ~/export-swarm-key-linux-amd64
# 2,导出私钥
./export-swarm-key-linux-amd64 /data/.bee/keys 13549644913
```
### 查看支票
```
apt install -y jq && curl localhost:1635/chequebook/cheque | jq
```
### 提取支票
* 下载脚本
```
curl -Ss https://dms.filecoin.plus/sh_update/cashout.sh -o /root/cashout.sh && chmod +x /root/cashout.sh
```
* 手动提取
```
./cashout.sh cashout-all
```
* 计划任务提取
```
crontab -e 选 2
# 00 02 * * * /root/cashout.sh cashout-all
```



Other
```
sudo sed -i 's/rpc.slock.it\/goerli/goerli.infura.io\/v3\/e6fff007b27947cc88e54e85a175f631/g' /data/bee.yaml

##### curl -Ss https://dms.filecoin.plus/sh_update/export_swarm.sh -o /root/export_swarm.sh && bash export_swarm.sh
```
