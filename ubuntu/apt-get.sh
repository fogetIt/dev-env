#!/bin/bash
# @Date:   2017-04-01 14:27:49
# @Last Modified time: 2018-04-03 16:47:12
echo ${ENV_PASSWORD} | sudo -S echo -e "\033[1;;42m\n\033[0m"

# ***************************************************************
[[ ! -d ${ENV_SOFTWARES} ]] && mkdir ${ENV_SOFTWARES}
# ***************************************************************
# sudo password root
# su root
sudo cp -f ${ENV_PWD}/50-ubuntu.conf /usr/share/lightdm/lightdm.conf.d/
# ***************************************************************
which apt-fast && apt-fast -v | cat | head -n 2 || (
    sudo add-apt-repository -y ppa:saiarcot895/myppa
    sudo apt-get update
    sudo apt-get -y install apt-fast
    )
# ***************************************************************
which axel && axel -V | cat | head -n 2 || sudo apt install axel
which curl && curl --version | cat | head -n 1 || sudo apt-fast install curl -y
uget-gtk --version || (
    sudo add-apt-repository -y ppa:t-tujikawa/ppa
    sudo add-apt-repository -y ppa:plushuang-tw/uget-stable
    sudo apt-fast update
    sudo apt-fast -y install aria2 uget
    )
# ***************************************************************
git --version \
|| sudo apt-fast -y install git \
&& read -p "generate ssh key for github? [Y/n]" var \
&& [[ "${var}" == "Y" ]] && (
    git config --global user.name "forgetIt" \
    && git config --global user.email "2271404280@qq.com" \
    && echo -e "\n" | ssh-keygen -t rsa -C "2271404280@qq.com" \
    && cat ${HOME}/.ssh/id_rsa.pub \
    && read -p "add public key to github! [Y/n]"
)
# ***************************************************************
# install sublime and fcitx
subl -v || (
    cd ${ENV_SOFTWARES} \
    && rm -rf sublime-text* \
    && git clone https://github.com/lyfeyaj/sublime-text-imfix.git \
    && cd sublime-text-imfix \
    && echo "Y" | ./sublime-imfix \
    && subl
    # open sublime to makesure created configuration folder
)

read -p "overwrite sublime settings? [Y/n]" var \
&& [[ "${var}" == "Y" ]] \
&& cp -rf ${ENV_DIR}/sublime/* ${HOME}/.config/sublime-text-3/Packages/User/ \
&& read -p "please install package control!"
# ***************************************************************
wine --version || sudo apt-fast -y install wine  # run windows softwares
ssh -V || sudo apt-get install openssh-server -y
sudo apt-get install unrar -y



# ***************************************************************
which vim && vim --version | cat | head -n 2 || (
    sudo apt-fast -y install vim \
    && cp -f ${ENV_DIR}/vim/.vimrc ${HOME}/
    )
[[ ! -d ${ENV_SOFTWARES}/plugins ]] \
&& mkdir ${ENV_SOFTWARES}/plugins \
&& git clone git@github.com:VundleVim/Vundle.vim.git ${ENV_SOFTWARES}/plugins/Vundle
# ***************************************************************
sudo apt-get -y install tree
which atom && atom -v | cat | head -n 2 || (
    sudo add-apt-repository -y ppa:webupd8team/atom
    sudo apt-fast update
    sudo apt-fast -y install atom
    )
mongo --version || sudo apt-fast -y install mongodb-server mongodb-clients
mysql --version || sudo apt-fast -y install mysql-server mysql-client
redis-cli -v || sudo apt-fast -y install redis-server
nginx -v || sudo apt-fast install nginx -y
expect -v || sudo apt -y install expect  # 自动化完成交互的命令
which conky && conky -v | cat | head -n 2 || sudo apt-fast install conky -y
which docky && docky -v | cat | head -n 2 || sudo apt install docky -y
which unity-tweak-tool || (
    sudo apt-fast install unity-tweak-tool -y
    sudo add-apt-repository ppa:noobslab/themes    # flat theme
    sudo add-apt-repository ppa:noobslab/icons     # flat icons
    sudo add-apt-repository ppa:noobslab/macbuntu  # mac themes/icons/points
    sudo apt-fast update
    sudo apt-fast install -y flatabulous-theme ultra-flat-icons
    sudo apt-fast install -y macbuntu-os-icons-lts-v7 macbuntu-os-ithemes-lts-v7
)
terminator --version || sudo apt -y install terminator -y
# ***************************************************************
zsh --version || sudo apt -y install zsh
# use oh-my-zsh deploy zsh
[[ ${SHELL} != /usr/bin/zsh ]] \
&& echo ${ENV_PASSWORD} | chsh -s `which zsh` \
&& curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
# 编辑-->配置文件首选项
