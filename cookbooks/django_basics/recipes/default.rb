#
# Cookbook Name:: django_extensions
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

for pkg in node[:django_basics][:pip_packages]
  python_pip pkg do
    action :install
  end
end

directory '/file_store/' do
    mode 0777
    action :create
end

package 'libshadow-ruby1.8' do
    action :install
    end

user_account 'django' do
  comment   'Adding a user for owning the django stuff'
  home      '/home/django'
  ssh_keys  node[:django_basics][:ssh_keys]
end