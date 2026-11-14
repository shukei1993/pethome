# syntax=docker/dockerfile:1

# ---------- 构建阶段 ----------
FROM maven:3.8.6-jdk-8 AS builder
WORKDIR /build

COPY pom.xml .
COPY src ./src

RUN --mount=type=cache,target=/root/.m2 \
    mvn -B -DskipTests package

# ---------- 运行阶段 ----------
FROM eclipse-temurin:8-jre-jammy

ENV TZ=Asia/Shanghai \
    JAVA_OPTS="-XX:MaxRAMPercentage=75.0 -Duser.timezone=Asia/Shanghai -Dfile.encoding=UTF-8"

WORKDIR /app

RUN useradd -r -u 1001 -s /sbin/nologin appuser \
    && mkdir -p /app/logs \
    && chown -R appuser:appuser /app

COPY --from=builder --chown=appuser:appuser /build/target/pethome.jar /app/app.jar

USER appuser

EXPOSE 8080

ENTRYPOINT ["sh", "-c", "exec java $JAVA_OPTS -jar /app/app.jar"]