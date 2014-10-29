class UserMailer < ActionMailer::Base

  # default from: "forresttales@hotmail.com"
  default from: "registration@knowstory.com"
 
  def welcome_email(user)
    @user = user
    #@url  = 'http://example.com/login'
    #mail(to: user.email, subject: 'Welcome to My Awesome Site')
    
    mail(:to => user.email, :subject => 'The Learning Counsel and Clyde')
    
    #mail(:to => recipient.email_address_with_name, :bcc => ["bcc@example.com", "Order Watcher <watcher@example.com>"])    
    
  end  


  def password_reset(user)
    @user = user

    # mail :to => user.email, :subject => "Password Reset"
    
    mail(:to => user.email, :subject => 'Password Reset') do |format|
      format.html #{ render layout: 'my_layout' }
      #format.text
    end
    
  end


end
