# @Date:   2017-05-02 22:15:27
# @Last Modified time: 2017-12-26 16:06:40
echo $user_password | sudo -S echo -e "\033[1;;42m\n\033[0m"
atom -v
if [ $? != 0 ]; then
    sudo add-apt-repository -y ppa:webupd8team/atom
    sudo apt-fast update
    sudo apt-fast -y install atom
fi