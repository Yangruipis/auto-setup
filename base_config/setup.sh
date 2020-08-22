# !/usr/bin/bash

set -e

echo "SETUP_REPO_DIR:" ${SETUP_REPO_DIR}
echo "intall required tools"
apt-get update &&\
    apt-get install tmux zsh gawk curl

# tmux
echo "setup tmux"
cp ${SETUP_REPO_DIR}/base_config/tmux.conf ~/.tmux.conf

mkdir -p ${SETUP_REPO_DIR}/third_party/
tmp_dir=${SETUP_REPO_DIR}/third_party/tmux-powerline
[ ! -d ${tmp_dir} ] && git clone https://github.com/Yangruipis/tmux-powerline.git ${tmp_dir}

sed -i s@%POWERLINE_SH%@${tmp_dir}/powerline.sh@g ~/.tmux.conf
sed -i s@%CHIFG_AWK%@${SETUP_REPO_DIR}/base_config/chifg.awk@g ~/.tmux.conf

# zsh
echo "setup zsh"

if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
sudo chsh -s $(which zsh)

[ ! -f ~/.zshrc ] && cp ${SETUP_REPO_DIR}/base_config/zshrc ~/.zshrc

## zsh highlight
echo "  setup zsh highlight"
tmp_dir=${SETUP_REPO_DIR}/third_party/zsh-syntax-highlighting
[ ! -d ${tmp_dir} ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${tmp_dir}

sed -i s@%ZSH_SYNTAX_HIGHLIGHT%@${tmp_dir}/zsh-syntax-highlighting.zsh@g ~/.zshrc

## fzf
echo "  setup fzf"
if [ ! -d ~/.fzf2 ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf2
    pushd ~/.fzf2
    ./install << EOF
y
y
n
EOF
    popd
fi

sed -i s@"bindkey '^T' fzf-file-widget"@"bindkey '^Q' fzf-file-widget"@g ~/.fzf/shell/key-bindings.zsh


echo "SUCCESS"
