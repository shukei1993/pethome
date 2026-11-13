# pethome
## 本地启动

1. 安装 Docker Desktop（WSL2 后端）
2. `docker compose up -d`    # 启动 MySQL 5.7 / Redis 5，自动初始化 schema + seed
3. 启动 Spring Boot 应用
4. 测试账号：13800138000 / abc123

## 环境说明

| 服务 | 端口 | 说明            |
|---|---|---------------|
| MySQL | 3307 | 避免与本机 3306 冲突 |
| Redis | 6379 | 需要密码          |
| 应用 | 8080 | Spring Boot   |

