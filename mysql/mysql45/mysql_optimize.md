# 基于成本的优化

### MySQL 成本

#### I/O成本

#### CPU成本

### MySQL成本计算

- 读取一个页面的成本默认 1.0

- 检测一条记录是否符合搜索条件的默认成本 2.0
- 读取索引的一个扫描区间成本与读取一个页面的I/O成本是相同的。
- 回表的I/O成本，二级索引中有多少条记录就有多少个页面
- ref方法回表I/O成本设置上限，不能超过全表记录数的1/10个页面的I/O成本或者全表扫描的I/O成本的3倍

#### 基于成本的优化步骤

1. 根据搜索条件，找出所有可能使用的索引
2. 计算全表扫描的代价
3. 计算使用不同索引执行查询的代价
   1. 扫描区间的数量
   2. 需要回表的记录数量
4. 对比各种执行方案的代价，找出成本最低的那个方案。

#### 基于索引统计数据的成本计算

​	通过索引执行查询时产生多个单点扫描区间。

##### index_dive

​	通过质检访问索引B+数计算某个扫描区间的对应索引记录条数。

`eq_range_index_dive_limit`

例如：

​	查询区间为2000

​	索引平均重复次数为 10

​	回表记录数量为 2000 * 10 =20000



### 连接查询成本

- 单次查询驱动表的成本
- 多次查询被驱动表的成本

#### 条件过滤

​	驱动表**扇出值**的过程称为条件过滤

#### 连接成本分析

​	连接查询总成本 = 单次访问驱动表的成本 + 驱动表扇出值 * 单次访问被驱动表的成本

#### 多表连接查询成本

- 对于n表连接，有n!中连接顺序。
- 提前结束某种连接顺序的成本评估。
- 系统变量`optimizer_search_depth`
- 系统变量`optimizer_prune_level`

### 成本常数

#### mysql.server_cost

| 成本常数名称                 | 默认值 | 描述                                       |
| ---------------------------- | ------ | ------------------------------------------ |
| disk_temptable_create_cost   | 40.0   | 创建基于磁盘的临时表成本                   |
| disk_temptable_row_cost      | 1.0    | 向基于磁盘的临时表写入或读取一条记录的成本 |
| key_compare_cost             | 0.1    | 两条记录进行比较的成本                     |
| memory_temptable_create_cost | 2.0    | 创建基于内存的临时表成本                   |
| memory_temptable_row_cost    | 0.2    | 向基于内存的临时表写入或读取一条记录的成本 |
| row_evaluate_cost            | 0.2    | 读取并检测一条记录是否符合搜索条件的成本   |


#### mysql.engine_cost

| 成本常数名称           | 默认值 | 描述                           |
| ---------------------- | ------ | ------------------------------ |
| io_block_read_cost     | 1.0    | 从磁盘上读取一个对应块的成本。 |
| memory_block_read_cost | 1.0    | 从内存读取一个对应块的成本。   |

#### 刷新更新的成本常数

```sql
flush optimizer_costs;
```

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

#### innodb_index_stats

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

- n_leaf_pages : 表示该索引的叶子节点实际占用多少页面
- size ：表示该索引共占用多少页面
- n_diff_pfxNN ：表示对应索引列不重复的值有多少。

#### 定期更新统计数据

- 开启`innodb_stats_auto_recalc`同上可分别设置全局和指定表
- 手动运行`analyze table table_name`

#### 手动更新innodb_index_stats和innodb_table_stats

更新后运行`flush table table_name`

