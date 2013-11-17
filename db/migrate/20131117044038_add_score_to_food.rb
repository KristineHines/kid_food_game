class AddScoreToFood < ActiveRecord::Migration
  def change
  	add_column :foods, :score, :integer
  end
end
