# 使用基础镜像
#FROM ubuntu:22.04
FROM nvidia/cuda:12.8.1-base-ubuntu22.04
# 创建目标目录
RUN mkdir -p /app

COPY ./files /app/

# 设置工作目录
WORKDIR /app

# 运行命令（可选）
# RUN ["apt", "update"]
# RUN ["apt", "install","iproute2 lsb-release python3  python3-pip curl"]
# RUN ["pip","install","uv"]
# RUN ["uv","pip","install","-r","requirement.txt"]
RUN apt update -y \
&&apt install -y iproute2 lsb-release python3  python3-pip curl\
&& pip install uv\
&& uv pip install --system -r requirement.txt
