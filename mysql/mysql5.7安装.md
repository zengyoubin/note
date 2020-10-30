**基于CentOS 8** 

### 环境准备

#### 文件下载

```shell
wget https://cdn.mysql.com/archives/mysql-5.7/mysql-boost-5.7.27.tar.gz
```



#### 安装依赖

```shell
sudo yum install -y gcc gcc-c++ ncurses-devel perl cmake libtirpc-devel
# 解决 Could not find rpcgen 问题
wget https://github.com/thkukuk/rpcsvc-proto/releases/download/v1.4.1/rpcsvc-proto-1.4.1.tar.xz
xz -d rpcsvc-proto-1.4.1.tar.xz
tar -xvf rpcsvc-proto-1.4.1.tar
cd rpcsvc-proto-1.4.1
./configure
make && make install 

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
 tar -zxvf mysql-boost-5.7.27.tar.gz
 cd mysql-5.7.27
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

