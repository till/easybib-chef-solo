this_dir = File.dirname(__FILE__)
chef_dir = "#{this_dir}/chef-solo"

file_cache_path "#{chef_dir}"
cookbook_path [ "#{chef_dir}/cookbooks" ]
role_path "#{chef_dir}/roles"
recipe_url "http://github.com/till/easybib-cookbooks/zipball/master"