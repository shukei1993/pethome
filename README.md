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

---

## CI/CD 流程

### 链路概览

代码仓库与部署配置同源：ECS 上 `git pull` 拿到 `docker-compose.prod.yml` 与
`docker/sql/init/*.sql`，镜像则从 ACR 拉取，二者来源不同、认证方式也不同。

### 三个阶段

| 阶段 | 触发条件 | 执行内容 | 产物 |
|---|---|---|---|
| `build` | push / PR | `mvn -B -Dmaven.test.skip=true package` | `target/pethome.jar` |
| `docker` | `needs: build` | 读根目录 `Dockerfile` 多阶段构建，登录 ACR 后推送 | `<ACR>/pethome-shukei/app:latest` 与 `:<commit-sha>` |
| `deploy` | **仅 push 到 main** | SSH 到 ECS 执行滚动更新 | 新容器替换旧容器 |

`deploy` 上有 `if: github.ref == 'refs/heads/main' && github.event_name == 'push'`，
PR 与手动触发都不会碰生产环境。

### 必需的 GitHub Secrets

| Name | 用途 |
|---|---|
| `ACR_REGISTRY` | ACR 专属域名（个人版不是 `registry.cn-hongkong.aliyuncs.com`） |
| `ACR_USERNAME` | ACR 用户名 |
| `ACR_PASSWORD` | ACR 固定密码 |
| `SSH_HOST` | ECS 公网 IP |
| `SSH_USER` | ECS 登录用户（阿里云默认 `root`） |
| `SSH_KEY` | 专供部署的 ed25519 私钥全文（含 BEGIN/END 行） |

### 部署时服务器上发生什么

`deploy` job 实际执行：

```bash
cd /opt/pethome
git fetch origin main && git reset --hard origin/main   # 配置以仓库为准
APP_TAG=<commit-sha> docker compose -f docker-compose.prod.yml pull app
APP_TAG=<commit-sha> docker compose -f docker-compose.prod.yml up -d app

