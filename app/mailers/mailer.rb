class Mailer < ActionMailer::Base
  default from: "do-not-reply <enliken.dev@gmail.com>"

  def email_verification params={}
    @verify_url = params[:verify_url]
    mail to: params[:email], subject: "Enliken Identity authorization"
  end
end
