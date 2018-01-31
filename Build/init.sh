#!/bin/bash
# @Date:   2017-04-24 18:50:16
# @Last Modified time: 2018-01-31 13:35:43
# echo -e '...'
# 显示颜色、换行
echo ${PASSWORD} | sudo -S echo -e "\033[1;;42m\n\033[0m"

: "create SOFTWARES"
[[ ! -d ${SOFTWARES} ]] && mkdir ${SOFTWARES}
# sudo password root
# su root
sudo cp -f ${PWD}/50-ubuntu.conf /usr/share/lightdm/lightdm.conf.d/
# ***************************************************************
# sudo vi /etc/apt-fast.conf
which apt-fast && apt-fast -v | cat | head -n 2 || (
    sudo add-apt-repository -y ppa:saiarcot895/myppa
    sudo apt-get update
    sudo apt-get -y install apt-fast
    )
# ***************************************************************
# multithreading terminal downloading tools, replace wget
which axel && axel -V | cat | head -n 2 || sudo apt install axel
# ***************************************************************
git --version || sudo apt-fast -y install git

git --version && read -p \
    "warning
    generate id_rsa, id_rsa.pub in ~/.ssh? [Y/n]" var \
&& [[ "${var}" == "Y" ]] \
&& (
    git config --global user.name "forgetIt" \
    && git config --global user.email "2271404280@qq.com" \
    && echo -e "\n" | ssh-keygen -t rsa -C "2271404280@qq.com" \
    && cat ${HOME}/.ssh/id_rsa.pub \
    && read -p \
        "warning
        copy and paste this public key to github! [Y/n]" var \
    && [ "${var}" != "Y" ] \
    && exit 0
    )

git --version && read -p \
    "warning
    clone repositories? [Y/n]" var \
&& [[ "${var}" == "Y" ]] \
&& (
    [[ ! -d ${HOME}/github ]] && mkdir ${HOME}/github
    cd ${HOME}/github \
    && sudo rm -rf ./* \
    && git init \
    && git clone git@github.com:forgetIt/tools.git \
    && echo "clone repositories success"
    )
# ***************************************************************
# use sublime-text-imfix to install sublime and fcitx(input method framework, support chinese)
subl -v || (
    cd ${SOFTWARES} \
    && rm -rf sublime-text* \
    && git clone https://github.com/lyfeyaj/sublime-text-imfix.git \
    && cd sublime-text-imfix \
    && echo "Y" | ./sublime-imfix \
    && subl
    # open sublime to makesure created configuration folder
)

read -p "warning
    overwrite sublime settings? [Y/n]" var \
&& [[ "${var}" == "Y" ]] \
&& cp -rf ${DIR}/sublime/* \
    ${HOME}/.config/sublime-text-3/Packages/ \

read -p \
    "warning
    please install package control!"
# ***************************************************************
# for Windows softwares(e.g. qq)
wine --version || sudo apt-fast -y install wine
# ***************************************************************