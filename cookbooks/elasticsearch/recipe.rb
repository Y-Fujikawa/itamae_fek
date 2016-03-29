execute "Install Java8" do
  user "root"
  command "yum -y install java-1.8.0-openjdk-headless"
end

execute "Import rpm" do
  user "root"
  command "rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch"
end

template "/etc/yum.repos.d/elasticsearch.repo" do
  user "root"
  source "templates/etc/yum.repos.d/elasticsearch.repo.erb"
  mode "644"
end

execute "Install elasticsearch" do
  user "root"
  command "yum -y install elasticsearch"
end

service "elasticsearch" do
  user "root"
  action :start
end

execute "Install plugin" do
  user "root"
  command "/usr/share/elasticsearch/bin/plugin install lmenezes/elasticsearch-kopf/2.0"
  not_if "test -d /usr/share/elasticsearch/plugins/kopf"
end
