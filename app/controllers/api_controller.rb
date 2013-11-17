class ApiController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  def score_recipe
    ingredients = params[:ingredients]
    ingredients.map! {|ingredient| "1 " + ingredient}
    path = "https://api.edamam.com/api/nutrient-info?extractOnly&app_id=#{ENV["ED_APP_ID"]}&app_key=#{ENV["ED_APP_KEY"]}"
    @recipe = HTTParty.post(path, body: {title: params[:title], ingr: ingredients}.to_json, headers: {'Content-Type' => 'application/json'} )
    respond_to do |format|
      format.json { render json: @recipe}
    end
  end
end
