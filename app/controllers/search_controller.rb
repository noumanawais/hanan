class SearchController < ApplicationController
before_filter :authenticate_user! ,:user_signed_in?
def search_result
	@id=current_user.email

		@user=User.find(:all, :conditions => ["email = ?",@id])

	# @users=User.all


@notifications=Notification.find(:all, :conditions => ["receiver = ? AND status= ?",current_user.email ,1])		
	 @users=User.find(:all,:conditions => ["email Like ? ",'%'+params[:search]+'%'])

@users=@users-@user
	@count=@users.count
	@name=params[:search]
end
def search_results
	

		@user=User.find(:all, :conditions => ["email = ?",current_user.email])
		

@notifications=Notification.find(:all, :conditions => ["receiver = ? AND status= ?",current_user.email ,1])		

	# @users=User.all
	
@users=User.find(:all,:conditions => ["email Like ? ",'%'+params[:search]+'%'])

	
	 
	@users=@users-@user

	@count=@users.count

	@name=params[:search]
	render 'search_result'
end
def profile
    @user = User.new(params[:user])

    current_user.avatar=@user.avatar

    current_user.save!

@notifications=Notification.find(:all, :conditions => ["receiver = ? AND status= ?",current_user.email ,1])		
  end


def index

		
		@id=current_user.id
		@user=User.find(:all, :conditions => ["email = ?",@id])


	  	@posts=Post.find(:all, :conditions => ["user_id = ? OR status= ?",@id ,2])


	#@friends=Friend.find(:all, :conditions =>["email = ?",@id])

@notifications=Notification.find(:all, :conditions => ["receiver = ? AND status= ?",current_user.email ,1])		
		
		


	@friends=Friend.find(:all, :conditions =>["email = ?",current_user.email])

		

		
		@friends.each do |friend|  
		
		@posts=@posts+Post.find(:all, :conditions => ["user_id = ? AND status = ?", friend.friend_email,3])

		end




		@posts=@posts.sort { |x, y| y <=> x }
	  end


def advance
	@id=current_user.email

		@user=User.find(:all, :conditions => ["email = ?",@id])

 @users=User.find(:all,:conditions => ["email Like ? ",'%aa%'])

	@count=@users.count

end


	def add

	@my_id=current_user.email
	@friend=params[:id]

	@friend=Friend.new(:email => @my_id , :friend => @friend)
	@friend1=Friend.new(:email => params[:id], :friend => @my_id)


	if @friend.save && @friend1.save
		
		render "index"
	else
		render "index"
	end


	end


	def connect

	@idd=params[:id]

	@user=User.find(params[:id])

	@sender=current_user.id

	 @notify=Notification.new(:sender => @sender, :receiver => @user.email ,:status => 1, :user_id => @user.id)
	  if @notify.save

	redirect_to :action=>'index'
	else
	redirect_to :action => 'index' 

end


	end


	def requests



	@my_id=current_user.id

	@requests=Notification.find(:all,:conditions => ["user_id = ? AND status = ?",@my_id,1])


	if @requests
@notifications=Notification.find(:all, :conditions => ["receiver = ? AND status= ?",current_user.email ,1])		
	render "requests"
   	else 
   		redirect_to :action => 'index'

   end
	


	end

	def addPost

		@id=current_user.id

	@post=Post.new(:user_id=>@id , :body_text => params[:postText], :status => params[:share])  # status 1 means public

	

		if @post.save

			redirect_to :action=>'index'

		end

	end


	def addComment
	
	if params[:commentText].length > 0

		@id=current_user.email

		@comment=Comment.new(:commenter_id=>@id , :comment => params[:commentText], :post_id => params[:parent_id]) 

		if @comment.save 

			redirect_to :action=>'index'
		else
			redirect_to :action=>'index'
		
		end

	else

	redirect_to :action=>'index' 

			
	end
end

	def like

		@id=current_user.id

	@like=Like.new(:post_id=> params[:id] , :user_id => @id)  # status 1 means public

		if @like.save

			redirect_to :action=>'index'
	else
		redirect_to :action=>'index'


		end

	end

def advanceSearch

	@id1=current_user.email

		@user=User.find(:all, :conditions => ["email = ?",@id1])

 @users=User.find(:all,:conditions => ["email Like ? ",'%aa%'])

	@count=@users.count
@notifications=Notification.find(:all, :conditions => ["receiver = ? AND status= ?",current_user.email ,1])		

	render 'search_results'


end


def showFriends

@user=User.find(:all, :conditions => ["email = ?",current_user.email])

@user2=@user


@notifications=Notification.find(:all, :conditions => ["receiver = ? AND status= ?",current_user.email ,1])		

   current_user.friends.each do |friend| 
	
	@user=@user+User.find(:all, :conditions => ["email = ?",friend.friend_email])
	    
  end 

  @user=@user-@user2



end





def findAlumini

@id=current_user.email

@user=User.find(:all, :conditions => ["email = ?",@id])  #for notifications

@notifications=Notification.find(:all, :conditions => ["receiver = ? AND status= ?",current_user.email ,1])		

@users=User.find(:all)


end





end
