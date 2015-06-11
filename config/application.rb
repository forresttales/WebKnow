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

    # config.action_controller.asset_host = "assets.example.com"
    
    config.active_record.raise_in_transactional_callbacks = true
    
    config.action_view.embed_authenticity_token_in_remote_forms = true
    config.active_support.escape_html_entities_in_json = true
    config.active_record.whitelist_attributes = true

    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    Dir.glob("#{Rails.root}/app/assets/images/**/").each do |path|
      config.assets.paths << path
    end
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif *.svg *.ico *.eot *.ttf *woff)
    
    # config.assets.precompile << Proc.new { |path|
      # if path =~ /\.(eot|svg|ttf|woff)\z/
        # true
      # end
    # }    
    

    config.assets.enabled = true
    config.assets.precompile += [
                                  'chosen.jquery.js',
                                  'chosen.proto.js',
                                  'control_elements.js',
                                  'dot.js',
                                  'jqModal.js',
                                  # 'jquery.colorbox.js',
                                  'jquery.easing.1.3.js',
                                  'jquery.fullscreenslides.js',
                                  'jquery.Jcrop.js',
                                  'jquery.mousewheel.js',
                                  'jquery.qtip.min.js',
                                  'jquery.selectbox-0.6.1.js',
                                  'jquery.sparkbox-select.js',
                                  'jquery.validate.js', 
                                  'jquery-dropdown-dot.js',
                                  'jquery_ui_1.10.4.js',
                                  'jquery.multiselect.js',
                                  'nav-jquery.js',
                                  'slick.js'                                  
                                  # 'toucheffects.js'
                                ]

    # *** already in application.css ***
    # require 'init_html'
    # require 'ks-tip'
    # require 'nav_main'
    # require 'table'
    config.assets.precompile += [
                                  'chosen.css',
                                  'control_elements.css',
                                  'custom_dialog.css',
                                  'custom_form.css',
                                  'custom_image.css',
                                  'custom_landing.css',
                                  'custom_nav.css',
                                  'custom_page_layout.css',
                                  'custom_page.css',
                                  'custom_profile.css',
                                  'custom_sign_form.css',
                                  # 'custom.css',
                                  'forms.css',
                                  # 'fullscreenstyle.css',
                                  # 'init_html.css'
                                  # 'ink_screen_2.css'
                                  'jqModal.css',
                                  'jqModal-11.css',
                                  'jquery_image_overlay.css',
                                  'jquery_ui_1.10.4.css',
                                  'jquery.Jcrop.css',
                                  'jquery.multiselect.css',
                                  'jquery.qtip.min.css',
                                  # 'ks_footer.css',
                                  # 'ks_tip.css',
                                  'ks-profile.css',
                                  # 'nav_main.css',
                                  'nav_publisher.css',
                                  'profile-new.css',
                                  'publisher_users_index_home.css',
                                  'publisher-product-manifest.css',
                                  'slick.css',
                                  'slick-theme.css',
                                  'slideshow.css',
                                  'static_pages.css',
                                  # 'table.css',
                                  'users.css',
                                  'z_custom_mtablets_tabs.css',
                                  'z_custom_mtablets.css'
                                ]
    
    # config.assets.precompile += [
                                  # 'chosen.css.scss',
                                  # 'custom_dialog.css.scss',
                                  # 'custom_form.css.scss',
                                  # 'custom_image.css.scss',
                                  # 'custom_landing.css.scss',
                                  # 'custom_nav.css',
                                  # 'custom_page_layout.css.scss',
                                  # 'custom_page.css',
                                  # 'custom_profile.css',
                                  # 'custom_sign_form.css',
                                  # 'custom.css.scss',
                                  # 'forms.css.scss',
                                  # # 'init_html.css.scss'
                                  # 'jqModal.css',
                                  # 'jquery_image_overlay.css',
                                  # 'jquery_ui_1.10.4.css',
                                  # 'jquery.multiselect.css',
                                  # 'jquery.qtip.min.css',
                                  # 'ks-profile.css',
                                  # # 'ks-tip.css.scss',
                                  # # 'nav_main.css.scss',
                                  # 'profile-new.css.scss',
                                  # 'slideshow.css.scss',
                                  # 'slick.css',
                                  # 'slick-theme.css.scss',
                                  # 'slideshow.css',
                                  # 'static_pages.css.scss',
                                  # # 'table.css.scss',
                                  # 'users.css.scss',
                                  # 'z_custom_mtablets_tabs.css.scss',
                                  # 'z_custom_mtablets.css.scss'
                                # ]




    
  end
end







