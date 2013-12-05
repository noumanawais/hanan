class Comment < ActiveRecord::Base

belongs_to :post

validates_uniqueness_of :commenter_id, :scope => [:commenter_id, :comment]

end
