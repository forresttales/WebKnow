Webknow::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
  #config.middleware.insert_before ActionDispatch::Static, Rack::SSL, :exclude => proc { |env| env['HTTPS'] != 'on' }

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  config.log_level = :debug

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  config.serve_static_files = false  
  config.assets.js_compressor = :uglifier
  config.assets.css_compressor = :sass

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
  config.assets.compress = true

  ActionMailer::Base.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address              => "smtp.live.com",
    :port                 => 587,
    :domain               => 'mail.live.com',
    :user_name            => 'forresttales@hotmail.com',
    :password             => 'wolftalk666',
    :authentication       => 'plain',
    :enable_starttls_auto => true  
  }
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }  
  
  # ActionMailer::Base.delivery_method = :smtp
#   
  # config.action_mailer.smtp_settings = {
    # :address              => "relay-hosting.secureserver.net",  
    # :port                 => 25,      
    # :domain               => 'www.knowstory.com',
    # :user_name            => 'registration@knowstory.com',
    # :password             => 'wolftalk666',
    # :authentication       => 'plain',
    # :enable_starttls_auto => true  }

  # config.action_mailer.smtp_settings = {
    # :address              => "smtpout.secureserver.net ",
    # :port                 => 80,
    # :domain               => 'www.knowstory.com',
    # :user_name            => 'registration@knowstory.com',
    # :password             => 'wolftalk666',
    # :authentication       => 'plain',
    # :enable_starttls_auto => true  }

  # config.action_mailer.smtp_settings = {
    # :address              => "smtp.live.com",
    # :port                 => 587,
    # :domain               => 'mail.live.com',
    # :user_name            => 'forresttales@hotmail.com',
    # :password             => 'wolftalk666',
    # :authentication       => 'plain',
    # :enable_starttls_auto => true  }


  # config.cache_classes = false
  # config.eager_load = false
  # config.consider_all_requests_local       = true
  # config.action_controller.perform_caching = false
  # config.action_mailer.raise_delivery_errors = false
  # config.active_support.deprecation = :log
  # config.active_record.migration_error = :page_load
  # config.assets.debug = true

end
