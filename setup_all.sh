# !/usr/bin/bash

source env.sh

if ./base_config/setup.sh | grep "SUCCESS" >/dev/null; then
    echo "setup base config succ"
else
    echo "setup base config failed"
fi
