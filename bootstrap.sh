#!/bin/sh
####################################################################################
#                                                                                  #
# Run this script first. It'll setup chef and all dependencies.                    #
#                                                                                  #
# It will also get your recipes from a github repository.                          #
#                                                                                  #
####################################################################################


git_repo="http://github.com/till/easybib-cookbooks.git"
wget_opt=" --quiet"
cookbook="/tmp"
ruby_ver="ruby-enterprise_1.8.7-2010.02_amd64_ubuntu8.04.deb"

install_deps () {

    apt-get install --quiet -y build-essential wget ssl-cert

    local COUNT=$(dpkg --list|grep "ruby-enterprise"|wc -l)

    if [ "$COUNT" -eq "0" ]; then

        wget http://rubyforge.org/frs/download.php/71097/$ruby_ver $wget_opt -O ./$ruby_ver

        if [ -f ./$ruby_ver ]; then

            dpkg -i $ruby_ver
            if [ "$?" -gt "0"]; then
                echo "Failed installing Ruby Enterprise."
                return 1
            fi

        else
            echo "Could not download Ruby Enterprise."
            return 1
        fi

    fi

    local GEM_OPT="--no-ri --no-rdoc --no-test --quiet"

    gem install $GEM_OPT ohai
    gem install $GEM_OPT chef

    return 0
}

get_cookbooks () {

    local TS=$(date +%s)

    git clone --quiet http://github.com/till/easybib-cookbooks.git "${cookbook}/${TS}"
    ln -fs "${cookbook}/${TS}" "${cookbook}/current-cookbook"
    return 0
}


install_deps
if [ "$?" -gt "0" ]; then
    exit 1
fi

get_cookbooks
if [ "$?" -gt "0" ]; then
    exit 1
fi
