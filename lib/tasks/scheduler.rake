desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Updating feed..."	
end

task :send_emails => :environment do
  puts "sending emails"

  @user = User.all

  @user.each do |user|
  	 UserMailer.update_email(user).deliver
  end

task :update_time => :environment do
  puts "updateTime emails"

  @user = User.all

  @user.each do |user|
    n = user.email_frequency
  	user.nextsend = Time.now + n.days
  end

end