class Follow < ActiveRecord::Base
	belongs_to :user
	belongs_to :follower, :through => :user
	belongs_to :followed, :through => :user
end