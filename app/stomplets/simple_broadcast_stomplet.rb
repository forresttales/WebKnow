require 'torquebox-stomp'

class SimpleBroadcastStomplet

  def initialize()
    super
    # super @subscribers = []
  end

  def configure(stomplet_config)
    # super
  end

  def on_message(stomp_message, session)
    @subscribers.each do |subscriber|
      subscriber.send( stomp_message )
    end
  end

  def on_subscribe(subscriber)
    @subscribers << subscriber
  end
 
  def on_unsubscribe(subscriber)
    @subscribers.delete( subscriber )
  end

end