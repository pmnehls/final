class Favorite < ActiveRecord::Base

  belongs_to :user, dependent: :destroy
  belongs_to :restaurant, dependent: :destroy

  # to prevent a user from adding a restaurant to a list more than once
  validates_uniqueness_of :restaurant_id, scope: :user_id
  validates_uniqueness_of :number, scope: :user_id

end