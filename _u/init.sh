#!/bin/bash
# @Date:   2017-04-24 18:50:16
# @Last Modified time: 2018-02-07 15:22:52
# echo -e '...'
# 显示颜色、换行
echo ${ENV_PASSWORD} | sudo -S echo -e "\033[1;;42m\n\033[0m"

[[ ! -d ${ENV_SOFTWARES} ]] && mkdir ${ENV_SOFTWARES}
# ***************************************************************
# sudo password root
# su root
sudo cp -f ${ENV_PWD}/50-ubuntu.conf /usr/share/lightdm/lightdm.conf.d/
# ***************************************************************
# sudo vi /etc/apt-fast.conf
which apt-fast && apt-fast -v | cat | head -n 2 || (
    sudo add-apt-repository -y ppa:saiarcot895/myppa
    sudo apt-get update
    sudo apt-get -y install apt-fast
    )
# ***************************************************************
: <<"COMMENT"
wget   single threading downloader
axel   multithreading downloader
uget   multithreading downloader with GUI
    编辑——>设置——>插件——>aria2/curl
COMMENT
which axel && axel -V | cat | head -n 2 || sudo apt install axel
which curl && curl --version | cat | head -n 1 || sudo apt-fast install curl -y
uget-gtk --version || (
    sudo add-apt-repository -y ppa:plushuang-tw/uget-stable
    sudo apt-fast update
    sudo apt-fast -y install uget
    sudo add-apt-repository -y ppa:t-tujikawa/ppa
    sudo apt-fast update
    sudo apt-fast -y install aria2
    )
# ***************************************************************
git --version || sudo apt-fast -y install git

git --version && read -p "generate id_rsa, id_rsa.pub in ~/.ssh? [Y/n]" var \
&& [[ "${var}" == "Y" ]] \
&& (
    git config --global user.name "forgetIt" \
    && git config --global user.email "2271404280@qq.com" \
    && echo -e "\n" | ssh-keygen -t rsa -C "2271404280@qq.com" \
    && cat ${HOME}/.ssh/id_rsa.pub \
    && read -p ">>>copy and paste this pub key to github! [Y/n]" var \
    && [ "${var}" != "Y" ] \
    && exit 0
    )
# ***************************************************************
# use sublime-text-imfix to install sublime and fcitx(input method framework, support chinese)
subl -v || (
    cd ${ENV_SOFTWARES} \
    && rm -rf sublime-text* \
    && git clone https://github.com/lyfeyaj/sublime-text-imfix.git \
    && cd sublime-text-imfix \
    && echo "Y" | ./sublime-imfix \
    && subl
    # open sublime to makesure created configuration folder
)

read -p ">>>overwrite sublime settings? [Y/n]" var \
&& [[ "${var}" == "Y" ]] \
&& cp -rf ${ENV_DIR}/sublime/* ${HOME}/.config/sublime-text-3/Packages/ \

read -p ">>>please install package control!"
# ***************************************************************
# for Windows softwares(e.g. qq)
wine --version || sudo apt-fast -y install wine
# ***************************************************************