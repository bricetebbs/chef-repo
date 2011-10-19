#
# Cookbook Name:: django_extensions
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
python_pip "django-extensions" do
    # use this version since 0.7 is broken till the pull request is included
    # https://github.com/django-extensions/django-extensions/pull/141
    version "0.6"
    action :install
end
