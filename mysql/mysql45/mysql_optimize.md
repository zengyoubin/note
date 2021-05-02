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

