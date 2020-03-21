# 容器网路
1. 网桥 起到虚拟交换机的作用，工作在数据链路层，主要功能是根据mac地址学习来讲数据包转发到网桥的不同端口
2. veth pair: 被创建出来后，总是以两张虚拟网卡的形式成对出现。从其中一个网卡发出的数据包可以直接出现在对应的另一张网卡上
3. 每个容器在创建时，容器内部会有一个eth0网卡，宿主机会有一个对应的veth网卡，veth网卡插到了docker0网桥上，数据包由docker0处理
4. 统一机器不同容器之间通信
![](https://github.com/batscars/kube-study/blob/master/imgs/容器网络.jpg?row=true)