FROM hub-docker-h.tianrang-inc.com/tianshi/dind-nvidia-docker:10.1-cudnn7-runtime-ubuntu18.04-0.1.1

RUN add-apt-repository ppa:kelleyk/emacs && apt-get update\
    && apt-get -y install tmux zsh gawk curl jo jq silversearcher-ag netcat tree emacs27 fonts-powerline\
    && curl -fsSL https://deb.nodesource.com/setup_17.x | bash - \
    && apt-get install -y nodejs npm\
    pip3 install gpustat && chsh -s /usr/bin/zsh
