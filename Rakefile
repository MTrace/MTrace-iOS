# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'MTrace'

  app.vendor_project('vendor/NetInterface', :static)
  app.vendor_project('vendor/SimplePingHelper', :static)
  app.vendor_project('vendor/SimplePing', :static, :cflags => '-fobjc-arc')

  app.development do
    app.provisioning_profile = "Development.mobileprovision"
  end
end

IB::RakeTask.new do |project|
end
