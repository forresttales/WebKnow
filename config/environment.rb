# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Webknow::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => 'smtpout.secureserver.net',
  :domain  => 'www.knowstory.com',
  :port      => 80,
  :user_name => 'registration@knowstory.com',
  :password => 'wolftalk666',
  :authentication => :plain
}