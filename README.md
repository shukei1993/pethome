![CI](https://github.com/shukei1993/pethome/actions/workflows/ci.yml/badge.svg)
# pethome
## 本地启动

1. 安装 Docker Desktop（WSL2 后端）
2. `docker compose up -d`    # 启动 MySQL 5.7 / Redis 5，自动初始化 schema + seed

3. 复制配置模板并填入真实值：
     cp .env.example .env

4. 启动全部服务：
    docker compose up -d --build

5. 访问 http://localhost:8080

## 环境说明

| 服务 | 端口 | 说明            |
|---|---|---------------|
| MySQL | 3307 | 避免与本机 3306 冲突 |
| Redis | 6379 | 需要密码          |
| 应用 | 8080 | Spring Boot   |

## 云端部署

生产环境使用 `docker-compose.prod.yml`，镜像来自阿里云 ACR（由 GitHub Actions 自动构建推送）。

### 服务器准备

​```bash
apt install -y curl
curl -fsSL https://get.docker.com | bash
fallocate -l 2G /swapfile && chmod 600 /swapfile && mkswap /swapfile && swapon /swapfile
echo '/swapfile none swap sw 0 0' >> /etc/fstab
​```

### 部署

​```bash
git clone https://github.com/shukei1993/pethome.git /opt/pethome
cd /opt/pethome
cp .env.example .env   # 填入真实值
docker login --username=xxx crpi-xxx.cn-hongkong.personal.cr.aliyuncs.com
docker compose -f docker-compose.prod.yml pull
docker compose -f docker-compose.prod.yml up -d
​```

### 更新

​```bash
docker compose -f docker-compose.prod.yml pull app
docker compose -f docker-compose.prod.yml up -d app
​```

