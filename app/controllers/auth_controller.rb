class AuthController < ApplicationController
  def email_submit
    verify_url = AuthController::verify_url params[:email]
    Mailer.email_verification(email:params[:email],verify_url:verify_url).deliver
    render :text=>"verification email sent"
  end
  
  def email_verify
    rec = EmailVerification.find_by_email(params[:email])
    if rec.token==params[:token] && rec.updated_at>=1.day.ago
      authorize rec.updated_at, params[:email]
      redirect_to "/dashboard"
    else
      render :text=>"wrong token"
    end
  end
  
  def self.verify_url email
    require 'digest/md5'
    rec = EmailVerification.first_or_create :email=>email
    rec.save
    rec.token = Digest::MD5.hexdigest("#{Time.now}#{rec.id}")
    rec.save
    
    email = URI.encode_www_form_component(email)
    token = URI.encode_www_form_component(rec.token)
    "http://#{APP_HOST}/auth/email_verify?email=#{email}&token=#{token}"
  end
  
  def sign_out
    deauthorize
    redirect_to "/"
  end
    
end
