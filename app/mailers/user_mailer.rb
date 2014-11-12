class UserMailer < ActionMailer::Base
  default from: "uoftwebdev.president@gmail.com"

  def welcome_email(user)

    @user = user
    mail(to: @user.email, subject: 'SignUp Email')
    
  end

  def update_email(user)
    
    @user = user
    if @user.nextsend < Time.now
      newtime = Time.now + @user.email_frequency.days
      user.update_attribute(:nextsend, newtime)
      @YNCNPosts = Item.where(created_at: (Time.now - @user.email_frequency.days)..Time.now).where(type_of: "YNCNPost")
      @clubPosts = Item.where(created_at: (Time.now - @user.email_frequency.days)..Time.now).where(type_of: "ClubPost")
      mail(to: @user.email, subject: 'Automated Web Club Email')
    else 
      @user = user
    end
  end

end
