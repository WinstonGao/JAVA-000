# 24-课程笔记
##1.系统间通信方式
+ `文件:不方便，不及时`
+ `IPC:进程间通信`
+ `Socket:使用复杂`
+ `数据库：没法实时`
+ `RPC：调用关系复杂，强依赖，强耦合，同步处理无法缓冲`
  
   
`需要一种通信方式，满足：异步通信、简化依赖、可以缓冲、保证可靠甚至顺序`==`MQ`

Queue类比信箱

##2.从队列道消息服务
+ Message Queue--->Messaging System
+ Queue Message Producer Consumer
+ 死信队列（EIP）
+ exchange( )

>2.1**消息处理模式**
+ 点对点 PTP: Point-To-Point
+ 发布订阅 PuSub:
queue和topic的区别是什么？
>2.2消息处理的保障
+ 消息的Qos(服务质量)
  1. 至多一次
  2. 至少一次 roaring bitmap去重
  3. 精确一次  
+ 消息的事务性
  
+ 消息的顺序性  
  消息的分区、预取、并发等都会影响顺序

`企业集成模式`

##消息的协议
+ `STOMP` 简单文本处理
+ `JMS*` 客户端协议
   1. 
+ `AMQP*` 金融行业
+ `MQTT*` IBM 使用场景遥感，物联网
+ `XMPP` 使用场景IM Jabber
+ `Open Messaging` 阿里巴巴

>消息的通用结构

## 开源的消息中间件

1. ActiveMQ/RabbitMQ 
   (JMS/AMQP协议) ，不支持堆集，基于内存，容量有限制
   支撑queue, topic
2. Kafka/RocketMQ
   基于磁盘堆集， WAL技术，只支撑topic，不支持queue
3. Apache Pulsar
   计算和存储分离，（计算节点和存储节点可以互相增加）
   
# ActiveMQ使用场景？

##MQ的选型思考
+ 关于性能：吞吐量/延迟
+ 关于选型：场景指标
+ 关于开发： 抽象与封装
+ 关于维护： 稳定性/高可用


 

