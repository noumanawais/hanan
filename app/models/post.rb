class Post < ActiveRecord::Base

has_many :comments  
has_many :likes

has_one :user
belongs_to :user

end
