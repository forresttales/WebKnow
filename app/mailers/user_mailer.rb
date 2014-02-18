class UserMailer < ActionMailer::Base
  default from: "forresttales@hotmail.com"
 
  def welcome_email(user)
    @user = user
    #@url  = 'http://example.com/login'
    #mail(to: user.email, subject: 'Welcome to My Awesome Site')
    
    mail(:to => user.email, :subject => 'The Learning Counsel and Clyde')
    
    #mail(:to => recipient.email_address_with_name, :bcc => ["bcc@example.com", "Order Watcher <watcher@example.com>"])    
    
  end  
end
