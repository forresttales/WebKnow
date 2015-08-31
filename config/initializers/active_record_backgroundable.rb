# Enable backgroundable methods for ActiveRecord classes. Provides:
# class AModel < ActiveRecord::Base
#   always_background :a_method
# end
# 
# a_model_instance.background.another_method
if defined?(TorqueBox::Messaging::Backgroundable) && defined?(ActiveRecord::Base)
  ActiveRecord::Base.send(:include, TorqueBox::Messaging::Backgroundable)
end

# Thread.new do
#   # system("rackup private_pub.ru -s puma -E production -p 9292 --host webknow")
#   # system("rackup private_pub.ru -s puma -b 'ssl://webknow:7443?keystore=keystore.jks&keystore-pass=changeit' -E production")
#   # system("puma -b 'ssl://0.0.0.0:443?key=/etc/apache2/ssl/server.key&cert=/etc/apache2/ssl/server.crt'")
#   system("puma -C config/puma.rb")
# end