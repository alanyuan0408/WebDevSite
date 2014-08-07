# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
UoftWebSite::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.server_settings = {
    :address        => 'smtp.gmail.com',
    :domain         => '<your domain>',
    :port           => 587,
    :user_name      => '<your gmail>',
    :password       => '<your password>',
    :authentication => :plain
}

ActionMailer::Base.raise_delivery_errors = true