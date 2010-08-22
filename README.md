# EasyBib's chef-solo setup

This is more or less a POC to learn `chef-solo`.

The only role contained is currently `devserver`. My `solo.rb` relies on [EasyBib's cookbooks][cb].

[cb]: http://github.com/till/easybib-cookbooks

## HowTo

 * run `bootstrap.sh` to install the bare minimum needed for `chef-solo`
 * run `git clone git://github.com/till/easybib-chef-solo.git`
 * create a `node.js`:

    { "run_list": "role[devserver]" }

 * run `chef-solo -c ./easybib-chef-solo/solo.rb -j node.js`