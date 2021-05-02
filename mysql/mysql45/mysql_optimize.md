## 基于成本的优化

### MySQL 成本

#### I/O成本

#### CPU成本

### MySQL成本计算

- 读取一个页面的成本默认 1.0

- 检测一条记录是否符合搜索条件的默认成本 2.0
- 读取索引的一个扫描区间成本与读取一个页面的I/O成本是相同的。
- 回表的I/O成本，二级索引中有多少条记录就有多少个页面

### 基于成本的优化步骤

1. 根据搜索条件，找出所有可能使用的索引
2. 计算全表扫描的代价
3. 计算使用不同索引执行查询的代价
   1. 扫描区间的数量
   2. 需要回表的记录数量
4. 对比各种执行方案的代价，找出成本最低的那个方案。

## InnoDB 统计数据

### 统计数据的存储方式

#### 全局

```sql
show variables like 'innodb_stats_persistent';
````

- 永久性的存储统计数据（5.6.6之后默认开启）
- 非永久性的存储统计数据

#### 指定表

```sql
create table table_name (...) engine='Innodb',stats_persistent=(0|1);
alter table table_name engine='Innodb',stats_persistent=(0|1);
```



### 基于磁盘的永久性统计

- `innodb_index_stats` 存储关于索引的统计数据
- `innodb_table_stats` 存储关于表的统计数据

#### innodb_table_stats

| 字段名                   | 描述                       |
| ------------------------ | -------------------------- |
| database_name            |                            |
| table_name               |                            |
| last_update              |                            |
| n_rows                   | 表中的记录的条数           |
| clustered_index_size     | 表的聚簇索引占用的页面数量 |
| sum_of_other_index_sizes | 表的其他索引占用的页面数量 |

##### n_rows

​	按照一定算法从聚簇索引中选取几个叶子节点页面，统计每个页面包含的记录数量，然后计算一个页面中平均包含的记录数量，并将其乘以全部叶子节点的数量。

###### 统计页面数量

- 全局

```sql
show variables like 'innodb_stats_persistent_sample_pages';	
```

- 指定表

```sql
create table table_name (...) engine='Innodb',stats_sample_pages=20;
alter table table_name engine='Innodb',stats_sample_pages=20;
```

##### clustered_index_size和sum_of_other_index_sizes

​	通过表空间的Segment Header内的一些字段来统计。

### innodb_index_stats

| 字段名           | 描述         |
| ---------------- | ------------ |
| database_name    |              |
| table_name       |              |
| index_name       |              |
| last_update      |              |
| stat_name        | 统计项名称   |
| stat_value       | 统计值       |
| sample_size      | 采样页面数量 |
| stat_description |              |

