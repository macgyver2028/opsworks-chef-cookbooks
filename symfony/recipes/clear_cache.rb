#
# Clear Symfony Cache.
#
node[:deploy].each do |application, deploy|
  #execute 'clear_symfony_cache_prod' do
  script "clear_symfony_cache" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    #code <<-EOH
    #php app/console cache:clear --env=prod --no-debug 
    #EOH
    # The command below doesn't appear to be running..so added the above block
    command "php app/console cache:clear --env=prod --no-debug"
    action :run
  end
end

