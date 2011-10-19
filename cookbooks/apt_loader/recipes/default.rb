#
# Cookbook Name:: apt_loader
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
for pkg in node[:apt_loader][:apt_packages] 
  apt_repository pkg do
    action :add 
  end
end
