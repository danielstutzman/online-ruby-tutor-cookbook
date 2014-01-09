group node['online-ruby-tutor']['group']

user node['online-ruby-tutor']['user'] do
  group node['online-ruby-tutor']['group']
  system true
  shell '/bin/bash'
end
