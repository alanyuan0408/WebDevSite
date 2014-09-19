class UserMailer < ActionMailer::Base
  default from: "alan.yuan@mail.utoronto.ca"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Testing new mailing feature')
  end

  def update_email(user)
    if user.nextsend < Time.now
      @user = user
      @user.nextsend = Time.now + user.email_frequency.days
      @YNCNPosts = Item.where(created_at: (Time.now - @user.email_frequency.days)..Time.now).where(type_of: "YNCNPost")
      @clubPosts = Item.where(created_at: (Time.now - @user.email_frequency.days)..Time.now).where(type_of: "ClubPost")
      mail(to: @user.email, subject: 'Automated Web Club Email')
    end
  end

end
