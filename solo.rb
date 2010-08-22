this_dir = File.dirname(__FILE__)

file_cache_path "#{this_dir}/chef-solo"
cookbook_path [ "#{this_dir}/chef-solo/cookbooks" ]
role_path "#{this_dir}/chef-solo/roles"
recipe_url "http://github.com/till/easybib-cookbooks/zipball/master"