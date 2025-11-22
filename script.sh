#!/usr/bin/env bash

OUT="/var/www/html/telemetry.json"

APACHE_STATUS=$(systemctl is-active apache2 2>/dev/null || echo "inactive")
MYSQL_STATUS=$(systemctl is-active mariadb 2>/dev/null || echo "inactive")
PHP_VERSION=$(php -v 2>/dev/null | head -n1 | awk '{print $2}')
DOCKER_VERSION=$(docker --version 2>/dev/null | sed -n 's/.version \([^,]\).*/\1/p')
[ -z "$DOCKER_VERSION" ] && DOCKER_VERSION="not-installed"
KERNEL_VERSION=$(uname -r)
UPTIME_HUMAN=$(uptime -p | sed 's/up //')

# ---- UFW ----
UFW_STATUS=$(sudo ufw status | head -n1)

# Reglas UFW (a partir de la 5ª línea)
UFW_RULES=$(sudo ufw status | tail -n +5 | sed 's/"/\\"/g')

cat > "$OUT" <<EOF
{
  "apache_status": "${APACHE_STATUS}",
  "mysql_status": "${MYSQL_STATUS}",
  "php_version": "${PHP_VERSION}",
  "docker_version": "${DOCKER_VERSION}",
  "kernel_version": "${KERNEL_VERSION}",
  "uptime": "${UPTIME_HUMAN}",
  "ufw_status": "${UFW_STATUS}",
  "ufw_rules": [
$(echo "$UFW_RULES" | sed 's/^/    "/; s/$/"/; s/$/,/' | sed '$ s/,$//')
  ]
}
EOF
