# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Identity::Application.initialize!

ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  :address              => "email-smtp.us-east-1.amazonaws.com",
  :port                 => "587",
  :user_name            => "AKIAITS6WEQAA6SYD4CQ",
  :password             => "As4sWOWKfOmHkQsAga+7cl3s8/bIb8MLY08vwAUO6Z7+",
  :authentication       => :login,
  :enable_starttls_auto => true
}

