#!/usr/bin/env bash

__main() {
    while true; do
        rsync --daemon --no-detach --config=/apps/data/config/rsyncd.conf
        sleep 10s
    done
}

__main
