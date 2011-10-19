#
# Cookbook Name:: create_database
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "mysql::client"
include_recipe "mysql::server"

mysql_database "create application_production database" do
  host "localhost"
  username "root"
  password node[:mysql][:server_root_password]
  database node[:create_database][:database]
  action :create_db
end

mysql_database "create user  #{node[:create_database][:user]} for #(node[:create_database][:database]}" do
    sql "create user '#{node[:create_database][:user]}'@localhost identified by '#{node[:create_database][:password]}';"
    host "localhost"
    username "root"

    database node[:create_database][:database]
    password node[:mysql][:server_root_password]
    only_if { `/usr/bin/mysql -u root -p#{node[:mysql][:server_root_password]} -D mysql -r -B -N -e \"SELECT COUNT(*) FROM user where User='#{node[:create_database][:user]}' and Host = 'localhost'"`.to_i == 0 }
    action :query

end

#
# Rights granting is not idempotent. Cry
#
mysql_database "grant server access rights for user '#{node[:create_database][:user]}" do
    sql "grant usage on *.* to '#{node[:create_database][:user]}'@localhost identified by '#{node[:create_database][:password]}';"
    host "localhost"
    username "root"
    password node[:mysql][:server_root_password]

    database node[:create_database][:database]
    action :query

end

mysql_database "grant rights for user '#{node[:create_database][:user]} for #(node[:create_database][:database]}" do
    sql "grant all on #{node[:create_database][:database]}.* to '#{node[:create_database][:user]}'@localhost;"
    host "localhost"
    username "root"
    password node[:mysql][:server_root_password]

    database node[:create_database][:database]
    action :query
end

