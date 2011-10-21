package "nginx" do
    :upgrade
end

service "nginx" do
  enabled true
  running true
  supports :status => true, :restart => true, :reload => true
  action [:enable]
end


template"/etc/nginx/nginx.conf" do
  source "nginx.conf.erb"
   mode 0640
  owner "root"
  group "root"
  notifies :restart, resources(:service => "nginx")
  if node[:instance_role] == 'vagrant'
    variables  ( :listen_addr => "0.0.0.0:8000")
  else
    variables  ( :listen_addr => "80")
  end

end