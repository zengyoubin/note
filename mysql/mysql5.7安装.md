**基于CentOS 8** 

#### 文件下载

```shell
wget https://cdn.mysql.com/archives/mysql-5.7/mysql-5.7.27-linux-glibc2.12-x86_64.tar.gz
```





#### 账户创建

开始着手 MySQL 编译安装的步骤。首先为添加 MySQL 对应的系统账户，用于保证其本地文件权限分配

```shell
groupadd mysql
useradd -r -g mysql mysql
```

创建数据库目录

```
mkdir -p /var/mysql/data
chown mysql:mysql /var/mysql/data
```

### 编译安装

#### 解压

```shell
tar -zxvf mysql-5.7.27-linux-glibc2.12-x86_64.tar.gz
mv mysql-5.7.27-linux-glibc2.12-x86_64 mysql-5.7.27
```

#### 编译安装

```shell
cmake \
-DCMAKE_INSTALL_PREFIX=/usr/local/mysql \
-DMYSQL_UNIX_ADDR=/usr/local/mysql/mysql.sock \
-DDEFAULT_CHARSET=utf8mb4 \
-DDEFAULT_COLLATION=utf8mb4_general_ci \
-DWITH_INNOBASE_STORAGE_ENGINE=1 \
-DWITH_ARCHIVE_STORAGE_ENGINE=1 \
-DWITH_BLACKHOLE_STORAGE_ENGINE=1 \
-DMYSQL_DATADIR=/var/mysql/data \
-DMYSQL_TCP_PORT=3306 \
-DWITH_BOOST=boost

make && make install
```

安装时遇到内存不足，通过设置2G交换分区来解决该问题

```shell
#获取要增加的2G的SWAP文件块
dd if=/dev/zero of=/swapfile bs=1k count=2048000
#创建SWAP文件
mkswap /swapfile 
#激活SWAP文件
swapon /swapfile   
#查看SWAP信息是否正确
swapon -s  
#添加到fstab文件中让系统引导时自动启动
echo "/var/swapfile swap swap defaults 0 0" >> /etc/fstab
```

swapfile文件的路径在/var/下，编译完后, 如果不想要交换分区了, 可以删除。

```
swapoff /swapfile
rm -rf /swapfile
```

