
python_pip 'gunicorn' do
    action :install
end


template "/etc/init.d/gunicorn_django"do
  source "gunicorn_django.erb"
  owner "root"
  group "root"
  mode 0755
end


service "gunicorn_django" do
  enabled true
  running true
  supports :restart => true, :reload => true
  action [ :enable]
end
