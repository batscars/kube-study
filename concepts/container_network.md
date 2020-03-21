# 容器网路
1. 网桥: 起到虚拟交换机的作用，工作在数据链路层，主要功能是根据mac地址学习来讲数据包转发到网桥的不同端口
2. Veth Pair: 被创建出来后，总是以两张虚拟网卡的形式成对出现。从其中一个网卡发出的数据包可以直接出现在对应的另一张网卡上
3. 每个容器在创建时，容器内部会有一个eth0网卡，宿主机会有一个对应的veth网卡，veth网卡插到了docker0网桥上，数据包由docker0处理
4. 机器内不同容器之间通信
![](https://github.com/batscars/kube-study/blob/master/imgs/容器网络.jpg?row=true)

# 容器跨主机网络(Flannel)
1. TUN设备(Tunnel设备)：工作在网络层的虚拟网络设备，主要功能在操作系统内核和用户应用程序之间传递IP包
2. flannel1设备收到操作系统的ip包时会将他传递给改设备的应用程序即Flanneld进程
3. Flanneld进程通过etcd保存容器子网与宿主机ip的对应关系
4. Flannel UDP模式
![](https://github.com/batscars/kube-study/blob/master/imgs/flannel_udp.jpg?row=true)
5. UDP模式缺陷：用户态和内核态交互次数太多
- 用户态的容器进程发出的 IP 包经过 docker0 网桥进入内核态；
- IP 包根据路由表进入 TUN（flannel0）设备，从而回到用户态的 flanneld 进程；
- flanneld 进行 UDP 封包之后重新进入内核态，将 UDP 包通过宿主机的 eth0 发出去。
6. VTEP(VXLAN Tunnel End Point): flannel.1,在内核态完成封装和解封
7. VNI：它是 VTEP 设备识别某个数据帧是不是应该归自己处理的重要标识
8. Flannel VXLAN模式
![](https://github.com/batscars/kube-study/blob/master/imgs/flannel_vxlan.jpg?row=true)
9. Flannel host-gw模式
下一跳地址：如果 IP 包从主机 A 发到主机 B，需要经过路由设备 X 的中转。那么 X 的 IP 地址就应该配置为主机 A 的下一跳地址
![](https://github.com/batscars/kube-study/blob/master/imgs/flannel_host_gw.jpg?row=true)

# Kubernetes网络模型
由k8s创建的容器通过cni网桥代替docker0网桥