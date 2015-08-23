class Follow < ActiveRecord::Base
	belongs_to :user
	belongs_to :follower, :class_name => "User"
	belongs_to :followed, :class_name => "User"

	validates_uniqueness_of :followed, scope: :follower

end