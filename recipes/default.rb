group node['online-ruby-tutor']['group']

user node['online-ruby-tutor']['user'] do
  group node['online-ruby-tutor']['group']
  system true
  shell '/bin/bash'
end

include_recipe 'apt'

apt_package 'nginx' do
  action :install
end

cookbook_file '/etc/nginx/nginx.conf' do
  source 'nginx.conf'
  action :create # will replace the file
  notifies :restart, 'service[nginx]', :delayed # will start if not started
end

service 'nginx' do
  action :start
end

include_recipe 'postgresql::server'
