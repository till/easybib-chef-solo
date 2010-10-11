this_dir = File.dirname(__FILE__)
chef_dir = "#{this_dir}/chef-solo"

if !File.exist?(chef_dir) then
    Dir.mkdir(chef_dir)
end

file_cache_path "#{chef_dir}"
cookbook_path [ "/tmp/current-cookbooks" ]
role_path "#{chef_dir}/roles"
