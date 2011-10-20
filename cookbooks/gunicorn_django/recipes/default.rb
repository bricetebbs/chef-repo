
python_pip 'gunicorn' do
    action :install
end


cookbook_file "/etc/init.d/gunicorn_django" do
  source "gunicorn_django"
  mode 0755
  owner "root"
  group "root"
 # notifies :restart, resources(:service => "gunicorn_django")
  action :create
end


service "gunicorn_django" do
  enabled true
  running true
  supports :restart => true, :reload => true
  action [:start, :enable]
end

