execute "Install td-agent" do
  user "root"
  command "curl -L https://toolbelt.treasuredata.com/sh/install-redhat-td-agent2.sh | sh"
end

service "td-agent" do
  user "root"
  action :start
end

gem_package "fluent-plugin-elasticsearch" do
  gem_binary "/usr/sbin/td-agent-gem"
end

template "/etc/td-agent/td-agent.conf" do
  user "root"
  source "templates/etc/td-agent/td-agent.conf.erb"
  mode "755"
end

service "td-agent" do
  user "root"
  action [:enable, :restart]
end
