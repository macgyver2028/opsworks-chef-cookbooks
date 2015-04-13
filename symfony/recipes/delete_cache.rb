#
# Delete Symfony Cache - Hack for broken clear_cache
#
node[:deploy].each do |application, deploy|
  script "delete_symfony_cache" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
    rm -rf app/cache/* 
    EOH
  end
end
