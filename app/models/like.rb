class Like < ActiveRecord::Base
belongs_to :post

validates_uniqueness_of :post_id, :scope => [:post_id, :user_id]

end
