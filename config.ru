# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

# map '/' do
  run Rails.application
# end


# # stomp
# require 'chat_demo'
# require 'torquebox-web'
# require 'torquebox-stomp'
# 
# extend TorqueBox::Injectors
# 
# # inject( '/topics/chat' )
# 
# use TorqueBox::Session::ServletStore
# use TorqueBox::Stomp::StompJavascriptClientProvider
# 
# run ChatDemo.new
