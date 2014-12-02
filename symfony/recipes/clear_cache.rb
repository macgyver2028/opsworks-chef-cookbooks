#
# Clear Symfony Cache.
#
node[:deploy].each do |application, deploy|
  #execute 'clear_symfony_cache_prod' do
  script "clear_symfony_cache" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    command "php app/console cache:clear --env=prod --no-debug"
    action :run
  end
end

