# s2i-python-container

基于 centos7 和 pyenv，可定制系统级依赖和任意 python 版本，同时最大程度保留大部分 s2i-python-container 的功能；

定制后请修改 Makefile 文件，并执行

```shell
make first && make build && make push
```
