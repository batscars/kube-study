# ansible.cfg配置
常用修改项:
1. private_key_file: ssh私钥文件
2. remote_port: ssh端口号
3. log_path: ansible执行的日志打印文件
# hosts.yml配置
参考地址:[http://www.ansible.com.cn/docs/intro_inventory.html#behavioral-parameters](http://www.ansible.com.cn/docs/intro_inventory.html#behavioral-parameters)
# playbook.yml配置
# run
```
ansible-playbook -i hosts.yml playbook.yml
```