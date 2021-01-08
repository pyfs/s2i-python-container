#!/usr/bin/env bash

echo "---> [!] start running pre hook script <---"

# yum repo: 清理并使用阿里云镜像
echo "---> [!] clean yum repo and get aliyun repos <---"
rm -rf /etc/yum.repo.d/*
curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
curl -o /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
sed -i -e '/mirrors.cloud.aliyuncs.com/d' -e '/mirrors.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo
yum makecache

echo "---> [!] end running pre hook script <---"
