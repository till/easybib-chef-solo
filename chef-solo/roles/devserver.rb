name 'devserver'
description 'Dev server'
run_list("recipe[easybib-base::setup]", "recipe[couchdb::server]", "recipe[nginx-app::server]", "recipe[gearman::server]", "recipe[redis::server]")
