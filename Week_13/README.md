#25: 分布式消息--Kafka消息中间件
##1.Kafka概念
###1.1 特性 
+ 持久化不会影响性能
+ 高吞吐率
+ 分布式消消费和顺序
+ 离线和实时
+ 在线水平扩展
###1.2 名词
+ Broker ,代理
+ Topic :逻辑概念
  多副本增加容错性
+ Partition ：物理概念，分区打散，并发消费
  增加扩展性，会影响性能
+ Producer
+ Consumer
+ Consumer Group：组内是协同消息，类似Queue,组和组之间，消息不重复，类似普通的广播topic

副本是一个什么概念？
为什么磁盘上文件数量太多，会编程随机读写？
##2.Kafka简单
kafka是客户端拉
##3.Kafka集群
ISR=In-Sync Replicas
##4.Kafka高级特性
生产者事务并发怎么加锁的

Consumer Group:
Offset Seek: 消费者客户端手动记录offset
 业务上堆offset有强要求的时候，可以自动提交
ReBalance: 
 Consumer Group的
 Broke 扩容或者某些不可用，导致rebalance