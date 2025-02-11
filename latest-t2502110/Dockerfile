FROM ghcr.io/lwmacct/250210-cr-buildx:latest-t2502110

RUN set -eux; \
    echo "安装 rsync"; \
    apt-get update; \
    apt-get install -y --no-install-recommends tini supervisor cron rsync; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*; \
    echo;

WORKDIR /apps/data
COPY apps/ /apps/
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["bash", "/apps/.entry.sh"]

LABEL org.opencontainers.image.source=https://github.com/lwmacct/250211-cr-rsync
LABEL org.opencontainers.image.description="rsync 工具"
LABEL org.opencontainers.image.licenses=MIT
