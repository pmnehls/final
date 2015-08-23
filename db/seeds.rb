Restaurant.delete_all
Category.delete_all
Neighborhood.delete_all
User.delete_all
List.delete_all
Follow.delete_all
Favorite.delete_all

restaurant_data = JSON.parse(open('db/restaurants.json').read)
category_data = JSON.parse(open('db/categories.json').read)
neighborhood_data = JSON.parse(open('db/neighborhoods.json').read)
user_data = JSON.parse(open('db/users.json').read)
list_data = JSON.parse(open('db/lists.json').read)
follow_data = JSON.parse(open('db/follows.json').read)
favorite_data = JSON.parse(open('db/favorites.json').read)


restaurant_data.each do |restaurant_hash|
	restaurant = Restaurant.new
	restaurant.name = restaurant_hash['name']

	# initialize categories
	category = Category.find_by(name: restaurant_hash['category'])
	if category == nil
		category = Category.new
		category.name = restaurant_hash['category']
		category.save
	end
	restaurant.category_id = category.id

  # initialize neighborhoods
  neighborhood = Neighborhood.find_by(name: restaurant_hash['neighborhood'])
  
  if neighborhood == nil
  	neighborhood = Neighborhood.new
  	neighborhood.name = restaurant_hash['neighborhood']
  	neighborhood.save
  end

  restaurant.neighborhood_id = neighborhood.id

	restaurant.address = restaurant_hash['address']
	restaurant.rating = restaurant_hash['rating']
	restaurant.image_url = restaurant_hash['image_url']
	restaurant.save
end

category_data.each do |category_hash|
	category = Category.find_by(name: category_hash['name'])
	if category == nil
		category = Category.new
		category.name = category_hash['name']
		category.save
	end
end

neighborhood_data.each do |neighborhood_hash|
	neighborhood = Neighborhood.find_by(name: neighborhood_hash['name'])
	if neighborhood == nil
		neighborhood = Neighborhood.new
		neighborhood.name = neighborhood_hash['name']
		neighborhood.save
	end
end

user_data.each do|user_hash|
	user = User.new
	user.username = user_hash['username']
	user.email = user_hash['email']
	user.password = user_hash['password']
	user.image_url = user_hash['image_url']
	if user_hash['admin']
		user.admin = true
	end
	user.save
end

list_data.each do |list_hash|
	list = List.new
	user = User.find_by(username: list_hash['username'])
	if user
		list.user_id = user.id
	end
	res = Restaurant.find_by(name: list_hash['restaurant'])
	if res
		list.restaurant_id = res.id
	end
	list.save
end

follow_data.each do |follow_hash|
	follow = Follow.new
	follow.follower_id = User.find_by(username: follow_hash['follower']).id
	follow.followed_id = User.find_by(username: follow_hash['followed']).id
	follow.save
end

favorite_data.each do |favorite_hash|
	favorite = Favorite.new
	user = User.find_by(username: favorite_hash['username'])
	if user
		favorite.user_id = user.id
	end
	res = Restaurant.find_by(name: favorite_hash['restaurant'])
	if res
		favorite.restaurant_id = res.id
	end

	favorite.number = favorite_hash['number']
	favorite.save
end

puts "Seeded successfully!"
