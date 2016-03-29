execute "Install Kibana" do
  user "root"
  cwd "/tmp"
  command <<-EOF
    wget https://download.elastic.co/kibana/kibana/kibana-4.4.2-linux-x64.tar.gz;
    tar zxvf kibana-4.4.2-linux-x64.tar.gz;
    mv /tmp/kibana-4.4.2-linux-x64 /opt;
    cd /opt;
    ln -s kibana-4.4.2-linux-x64 kibana;
    rm -fr /tmp/kibana-4.4.2-linux-x64.tar.gz;
  EOF
  not_if "test -d /opt/kibana-4.4.2-linux-x64"
end

template "/opt/kibana/config/kibana.yml" do
  user "root"
  source "templates/opt/kibana/config/kibana.yml.erb"
  mode "644"
end
