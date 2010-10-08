#!/bin/sh
####################################################################################
#                                                                                  #
# Run this script first. It'll setup chef and all dependencies.                    #
#                                                                                  #
####################################################################################

apt-get install -y build-essential wget ssl-cert

RUBY_DEB=ruby-enterprise_1.8.7-2010.02_amd64_ubuntu8.04.deb
wget http://rubyforge.org/frs/download.php/71097/$RUBY_DEB --quiet -O ./$RUBY_DEB

if [ -f ./$RUBY_DEB ]; then
    dpkg -i $RUBY_DEB

    if [ "$?" == "0" ]; then

        gem install -y ohai
        gem install -y chef

    else
        echo "Could not install Ruby Enterprise."
        exit 1
    fi

else
    echo "Could not download Ruby Enterprise."
    exit 1
fi

gem install -y ohai
gem install -y chef
