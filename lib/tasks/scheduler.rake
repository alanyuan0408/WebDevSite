desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Updating feed..."	
end

task :send_emails => :environment do
  puts "sending emails"

  @user = User.where(:email_confirmation_token, "confirmed")

  @user.each do |user|
  	 UserMailer.update_email(user).deliver
  end

end

task :update_time => :environment do
  puts "updateTime emails"

  @user = User.where(:email_confirmation_token, "confirmed")

  @user.each do |user|
    n = user.email_frequency
    newtime = Time.now + n.days
  	user.update_attribute(:nextsend, newtime)
  end

end

task :custom_email => :environment do
  puts "updateTime emails"

  @user = User.all

  @user.each do |user|
    UserMailer.custom_email(user).deliver
  end

end

task :alan_test => :environment do
  puts "Send test to Alan"

  @user = User.find_by_name("Admin")

  UserMailer.custom_email(user).deliver

end

end