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

