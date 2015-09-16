TorqueBox.configure do 
	stomplet DemoStomplet do 
		route '/queue/demo'
	end
end