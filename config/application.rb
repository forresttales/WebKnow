require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Webknow
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # config.autoload_paths += %w(#{config.root}/lib)

    config.action_view.embed_authenticity_token_in_remote_forms = true
    config.active_support.escape_html_entities_in_json = true
    config.active_record.whitelist_attributes = true

    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif *.svg *.ico *.eot *.ttf *woff)
    
    Dir.glob("#{Rails.root}/app/assets/images/**/").each do |path|
      config.assets.paths << path
    end

    config.assets.enabled = true
    config.assets.precompile += [
                                  'jquery.validate.js', 
                                  'chosen.jquery.js',
                                  'chosen.proto.js',
                                  'dot.js',
                                  'jqModal.js',
                                  'jquery.colorbox.js',
                                  'jquery.easing.1.3.js',
                                  'jquery.fullscreenslides.js',
                                  'jquery.mousewheel.js',
                                  'jquery.qtip.min.js',
                                  'jquery.selectbox-0.6.1.js',
                                  'jquery.sparkbox-select.js',
                                  'jquery-dropdown-dot.js',
                                  'nav-jquery.js',
                                  'toucheffects.js'
                                ]

    
  end
end







