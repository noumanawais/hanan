class HomeController < ApplicationController
  before_filter :authenticate_user! , :user_signed_in?

  def index
  end

  def secure
  end

  
end
