require 'torquebox-stomp' 

class DemoStomplet 
  
  def initialize() 
    super 
    @subscribers = []
  end 
  
  def configure(stomplet_config) 
    
  end 
  
  def on_message(stomp_message, session) 
    # send the message to each subscriber 
    @subscribers.each do |subscriber| 
      subscriber.send( stomp_message ) 
    end 
  end 
  
  def on_subscribe(subscriber) 
    # add a new subscriber 
    @subscribers << subscriber 
  end 
  
  def on_unsubscribe(subscriber) 
    # remove subscriber 
    @subscribers.delete( subscriber ) 
  end 


end