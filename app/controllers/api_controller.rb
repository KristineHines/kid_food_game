class ApiController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  

  def score_recipe(title, ingredients)
    hash = []
    ingredients.each do |i|
      hash << i
    end
    path = "https://api.edamam.com/api/nutrient-info?extractOnly&app_id=${9b30529f}&app_key=${aa24e6a5157cad9adc800890b9bf3143}"
    recipe = HTTParty.post(path, title: title, ingr: hash )
    return recipe.to_json
  end
end
