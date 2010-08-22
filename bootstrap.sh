#!/bin/sh
####################################################################################
#                                                                                  #
# Run this script first. It'll setup chef and all dependencies.                    #
#                                                                                  #
####################################################################################

apt-get install -y ruby ruby-dev libopenssl-ruby rdoc ri irb build-essential wget ssl-cert
gem install -y ohai
gem install -y chef
