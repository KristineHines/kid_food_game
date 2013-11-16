class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :image
      t.integer :group_id
      t.integer :category_id

      t.timestamps
    end
  end
end
