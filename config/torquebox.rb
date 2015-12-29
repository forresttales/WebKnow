TorqueBox.configure do 

    stomplet DemoStomplet do 
        route '/queue/demo' 
    end

    web do
      context "/"
      static "public"      
      host "webknow"
    end
    
    # web do
      # # rackup "alternative/path/to/my_config.ru"
      # # context "/app-one"
      # # static "public"
      # # host "www.host-one.com"
      # context "/"
      # host "webknow"
    # end
  
end

# TorqueBox.configure do
  # # ...
  # stomp do
    # # host'somehost.com'
    # host 'localhost:8675'
  # end
# 
  # # stomplet StompletOne do
    # # route '/queues/:queue_name'
  # # end
# 
  # stomplet SimpleBroadcastStomplet do
    # route '/queues/:queue_name'
  # end
# 
  # # stomplet BridgeStomplet do
    # # name 'foo.stomplet' # required if >1 stomplets use the same class, optional otherwise
    # # route '/bridge/foo'
    # # config do
      # # type 'queue'
      # # destination '/jms-queues/foo'
    # # end
  # # end
# # 
  # # stomplet BridgeStomplet do
    # # name 'bar.stomplet' # required if >1 stomplets use the same class, optional otherwise
    # # route '/bridge/bar'
    # # config :type => 'topic', :destination => '/jms-topics/bar'
  # # end
#   
# end