# yml = YAML.load_file("/config/authorize_net.yml")
yml = YAML.load_file(Rails.root.join('config/authorize_net.yml'))
# yml = YAML.load_file("#{RAILS_ROOT}/config/authorize_net.yml")
AUTHORIZE_NET_CONFIG = yml['default']
# AUTHORIZE_NET_CONFIG.merge!(yml[RAILS_ENV]) unless yml[RAILS_ENV].nil?
AUTHORIZE_NET_CONFIG.merge!(yml[Rails.env]) unless yml[Rails.env].nil?
AUTHORIZE_NET_CONFIG.freeze

#attachments.inline['logo-icon-come-together.png'] = File.read(Rails.root.join('public/repository/logo-icon-come-together.png'))