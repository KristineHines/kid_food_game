# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


food_carb_array = ["pasta", "potatoe", "sugar"]

food_carb_array.each do |food|
	category = Category.find_or_create_by_name("Carb")
	item = Food.create(name: food, category_id: category.id)
end

food_fruits_veggies_array = ["apple", "green_bean", "banana"]

food_fruits_veggies_array.each do |food|
	category = Category.find_or_create_by_name("Fruit_Veggies")
	item = Food.create(name: food, category_id: category.id)
end

food_protein_array = ["beef", "milk", "fish"]

food_protein_array.each do |food|
	category = Category.find_or_create_by_name("Protein")
	item = Food.create(name: food, category_id: category.id)
end