# @Date:   2017-05-02 22:15:27
# @Last Modified time: 2017-11-20 17:00:08
echo $USER_PASSWD | sudo -S echo -e "\033[1;;42m\n\033[0m"
atom -v
if [ $? != 0 ]; then
    sudo add-apt-repository -y ppa:webupd8team/atom
    sudo apt-fast update
    sudo apt-fast -y install atom
fi