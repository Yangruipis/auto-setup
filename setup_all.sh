# !/usr/bin/bash

source env.sh

if bash -x ./base_config/setup.sh | grep "SUCCESS" >/dev/null; then
    echo "setup base config succ"
else
    echo "setup base config failed"
fi

if bash -x ./emacs_config/setup.sh | grep "SUCCESS" >/dev/null; then
    echo "setup emacs config succ"
else
    echo "setup emacs config failed"
fi

if bash -x ./misc_config/setup.sh | grep "SUCCESS" >/dev/null; then
    echo "setup misc config succ"
else
    echo "setup misc config failed"
fi
