#
# Cookbook Name:: standard_pip
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
for pkg in node[:pip_loader][:pip_packages] 
  python_pip pkg do
    action :install
  end
end
