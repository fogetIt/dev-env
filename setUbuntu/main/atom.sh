# @Date:   2017-05-02 22:15:27
# @Last Modified time: 2017-07-07 10:13:57
atom -v
if [ $? != 0 ]; then
    echo $USER_PASSWD | sudo -S \
        add-apt-repository -y ppa:webupd8team/atom
    echo $USER_PASSWD | sudo -S \
        apt-fast update
    echo $USER_PASSWD | sudo -S \
        apt-fast -y install atom
fi