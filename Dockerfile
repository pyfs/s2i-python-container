# 构建阶段一
# 1.更新基础镜像
# 2.在基础镜像中安装系统级依赖
# 3.安装自定义 python 版本及相关依赖
# container: s2i-centos-django-first-satage
FROM openshift/base-centos7 AS FirstStage

# 维护人员
LABEL maintainer="peizhenfei@cvte.com"

ENV PATH=$HOME/.local/bin/:$PATH \
    PYTHONUNBUFFERED=1 \
    PYTHONIOENCODING=UTF-8 \
    PIP_NO_CACHE_DIR=off

# 容器镜像标签: 证明镜像为 s2i 生成
LABEL io.k8s.description="Platform for building Django" \
      io.k8s.display-name="builder s2i.centos.django"

# Copy extra files to the image.
COPY ./root/ /

# 安装依赖
RUN bash pre_hooks.sh && \
    yum update -y && yum install -y $(cat yum.txt | tr '\n' ' ') && \
    bash vendors/installer.sh && bash post_hooks.sh && \
    rm -rf vendors pre_hooks.sh post_hooks.sh && \
    yum -y clean all --enablerepo='*'


# 构建阶段二
# 1.调试 s2i 脚本
# container: s2i-python-container
FROM s2i-python-container-first-stage:latest AS Build

WORKDIR /opt/app-root/src/

COPY ./s2i/bin/ /usr/libexec/s2i

# 默认导出端口
EXPOSE 8080

# Set the default CMD to print the usage of the language image.
CMD /usr/libexec/s2i/usage
