class HomeController < ApplicationController
  def home
    redirect_to "/account/settings" if current_user
  end
end
