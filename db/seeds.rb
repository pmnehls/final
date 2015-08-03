Restaurant.delete_all
Category.delete_all
Neighborhood.delete_all
# User.delete_all
# Review.delete_all

restaurant_data = JSON.parse(open('db/restaurants.json').read)
category_data = JSON.parse(open('db/categories.json').read)
neighborhood_data = JSON.parse(open('db/neighborhoods.json').read)

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
  # restaurant.category = restaurant_hash['category']

  # initialize neighborhoods
  neighborhood = Neighborhood.find_by(name: restaurant_hash['neighborhood'])
  if neighborhood == nil
  	neighborhood = Neighborhood.new
  	neighborhood.name = restaurant_hash['neighborhood']
  	neighborhood.save
  end
  restaurant.neighborhood_id = neighborhood.id
	# restaurant.neighborhood = restaurant_hash['neighborhood']

	restaurant.address = restaurant_hash['address']
	restaurant.price = restaurant_hash['price']
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

puts "Seeded successfully!"
