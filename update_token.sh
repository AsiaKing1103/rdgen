#!/bin/bash
echo -n "請貼上新的 GitHub Token，按 Enter："
read -s NEW_TOKEN
echo ""
sed -i "s|GHBEARER: \".*\"|GHBEARER: \"${NEW_TOKEN}\"|" /volume1/docker/rdgen/docker-compose.yml
echo "Token 已更新，重啟容器中..."
DOCKER_HOST=unix:///var/run/docker.sock /volume1/@appstore/ContainerManager/usr/bin/docker compose -f /volume1/docker/rdgen/docker-compose.yml down
DOCKER_HOST=unix:///var/run/docker.sock /volume1/@appstore/ContainerManager/usr/bin/docker compose -f /volume1/docker/rdgen/docker-compose.yml up -d
echo "完成！"
