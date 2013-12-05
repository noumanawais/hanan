class SearchController < ApplicationController
before_filter :authenticate_user! ,:user_signed_in?
def search_result
	@id=current_user.email

		@user=User.find(:all, :conditions => ["email = ?",@id])

	# @users=User.all
	if(params[:search]==nil)
		params[:search]="none";
	end
		
	 @users=User.find(:all,:conditions => ["email Like ? ",'%'+params[:search]+'%'])

	@count=@users.count
	@name=params[:search]
#	render 'search_result'
end
def search_results
	@id=current_user.email

		@user=User.find(:all, :conditions => ["email = ?",@id])

	# @users=User.all
	if(params[:search]==nil)
		params[:search]="none";
	end
	 @users=User.find(:all,:conditions => ["email Like ? ",'%'+params[:search]+'%'])

	@count=@users.count

	@name=params[:search]
	render 'search_result'
end
def profile
    @user = User.new(params[:user])

    current_user.avatar=@user.avatar

    current_user.save!
  end


def index

		
		@id=current_user.id
		@user=User.find(:all, :conditions => ["email = ?",@id])


	  	@posts=Post.find(:all, :conditions => ["user_id = ? OR status= ?",@id ,2])


	#@friends=Friend.find(:all, :conditions =>["email = ?",@id])

		

		
	#	@friends.each do |friend|  
		
	#	@posts=@posts+Post.find(:all, :conditions => ["userid = ? AND status = ?", friend.friend,3])


#end

#@posts=@posts.sort { |x, y| y <=> x }
		
	  end


def advance
	@id=current_user.email

		@user=User.find(:all, :conditions => ["email = ?",@id])

 @users=User.find(:all,:conditions => ["email Like ? ",'%aa%'])

	@count=@users.count

end


	def add_friend

	@my_id=current_user.email
	@friend=params[:id]

	@friend=Friend.new(:email => @my_id , :friend => @friend)
	@friend1=Friend.new(:email => params[:id], :friend => @my_id)



	if @friend.save && @friend1.save
		
		render "index"
	end


	end


	def connect

	@idd=params[:id]

	@user=User.find(params[:id])

	@sender=current_user.email

	 @notify=Notification.new(:sender => @sender, :receiver => @user.email ,:status => 1, :user_id => @user.id)

	  if @notify.save

	redirect_to :action=>'index' 

end


	end


	def friend_requests

	@my_id=current_user.email

	@requests=Notification.find(:all,:conditions => ["receiver = ? AND status = ?",@my_id,1])



	render "requests"

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


	render 'search_results'


end


def showFriends

@id=current_user.email

@user=User.find(:all, :conditions => ["email = ?",@id])

@user2=@user


  @user.each do |user| 

   user.friends.each do |friend| 
	
	@user=@user+User.find(:all, :conditions => ["email = ?",friend.friend])
	    
  end 


  end 


end





def findAlumini

@id=current_user.email

@user=User.find(:all, :conditions => ["email = ?",@id])  #for notifications



@users=User.find(:all)


end





end
