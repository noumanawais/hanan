class Users::SessionsController < Devise::SessionsController
layout "smallheader"

def after_sign_in_path_for(resource)
    '/search/index'
  end







end
