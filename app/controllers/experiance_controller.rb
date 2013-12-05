class ExperianceController < ApplicationController

before_filter :authenticate_user! ,:user_signed_in?

  def new
  	render layout:false
  	@experiance=Experiance.new

  end

  def create
  	@id=current_user.id
  	
   	    	@experiance = Experiance.new(params[:experiance] )

  		
  

	@experiance.user_id=@id
  	if @experiance.save

  		render "/experiance/imageloader"

  	end
  			
  		
  end

  def imageloader
    @user = User.new
    
  end

  

end
