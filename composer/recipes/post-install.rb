#
#
node[:deploy].each do |application, deploy|
  script "composer_post_install" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
    php composer.phar run-script post-install-cmd
    EOH
  end
end 
