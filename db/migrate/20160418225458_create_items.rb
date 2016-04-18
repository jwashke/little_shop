class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.float :price
      t.string :image_path

      t.timestamps null: false
    end
  end
end
