json.array!(@foods) do |food|
  json.extract! food, :name, :image, :group_id, :category_id
  json.url food_url(food, format: :json)
end
