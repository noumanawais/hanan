class Users::RegistrationsController < Devise::RegistrationsController
before_filter :authenticate_user!, :only => :token


	layout "empty"

  
protected

  def after_sign_up_path_for(resource)
    '/experiance/new'
  end


end 


