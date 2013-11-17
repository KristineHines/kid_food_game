# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' } { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

food_grain_array = [
 %w(Macaroni), 
 %w(Muffin), 
 %w(Spaghetti), 
 ['White Bread', 'white-bread'],
 ['Wheat Bread', 'wheat-bread']
]

food_grain_array.each_with_index do |g, i|
  fg = FoodGroup.find_or_create_by_name("Grains")
  category = Category.find_or_create_by_name("Carbs")
  image = g[1] ||= g.first.downcase
  Food.create(name: g[0], category_id: category.id, image: image, group_id: fg.id, score: 2 )
end

food_sweets_array = [
 %w(Sugar), 
 %w(Chocolate),
 ["Ice Cream", 'vanilla-icecream'],
 ['Ice Cream', 'chocolate-icecream']
]

food_sweets_array.each_with_index do |g, i|
  fg = FoodGroup.find_or_create_by_name("Sweets")
  category = Category.find_or_create_by_name("Carbs")
  image = g[1] ||= g.first.downcase
  Food.create(name: g[0], category_id: category.id, image: image, group_id: fg.id, score: 1 )
end

food_fruit_array = [
  %w(Apple), 
  %w(Banana), 
  %w(Orange),
  %w(Strawberry)
]

food_fruit_array.each_with_index do |g, i|
  fg = FoodGroup.find_or_create_by_name("Fruits")
  category = Category.find_or_create_by_name("Fruit_Veggies")
  image = g[1] ||= g.first.downcase
  Food.create(name: g[0], category_id: category.id, image: image, group_id: fg.id, score: 4)
end


food_pro_array = [ 
  %w(Beef), 
  %w(Chicken),
  %w(Crab),
  %w(Egg),
  %w(Ham), 
  %w(Salmon), 
  %w(Tuna)
]

food_pro_array.each_with_index do |g, i|
  fg = FoodGroup.find_or_create_by_name("Protein")
  category = Category.find_or_create_by_name("Protein")
  image = g[1] ||= g.first.downcase
  Food.create(name: g[0], category_id: category.id, image: image, group_id: fg.id, score: 4)
end


food_dairy_array = [
  %w(Cheese),
  %w(Milk),
  %w(Yogurt)
]

food_dairy_array.each_with_index do |g, i|
  fg = FoodGroup.find_or_create_by_name("Dairy")
  category = Category.find_or_create_by_name("Protein")
  image = g[1] ||= g.first.downcase
  Food.create(name: g[0], category_id: category.id, image: image, group_id: fg.id, score: 3)
end

food_veg_array = [
  %w(Broccoli),
  %w(Carrot),
  %w(Eggplant),
  ["Green Beans", 'green_beans'],
  %w(Mushrooms), 
  %w(Potato), 
  %w(Tomato)
]

food_veg_array.each_with_index do |g, i|
  fg = FoodGroup.find_or_create_by_name("Vegtables")
  category = Category.find_or_create_by_name("Fruit_Veggies")
  image = g[1] ||= g.first.downcase
  Food.create(name: g[0], category_id: category.id, image: image, group_id: fg.id, score: 5)
end

