set -e

# ssh key
if [ ! -f /root/.ssh/id_rsa ]; then
    ssh-keygen -t rsa -b 2048 -C "r.yang@tianrang-inc.com" <<EOF



EOF
fi

# gpustat
pip3 install gpustat

# gitconfig
cp ${SETUP_REPO_DIR}/misc_config/gitconfig ~/.gitconfig

# ediff

if cat ~/.zshr | grep "alias ediff=" >/dev/null; then
    pass
else
    echo "alias ediff='${SETUP_REPO_DIR}/misc_config/ediff.py'" >> ~/.zshrc
fi
