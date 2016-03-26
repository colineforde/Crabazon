class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      # t.integer :reseller_id
      t.string :name
      t.integer :price
      t.string :description
      t.integer :inventory
      t.string :product_image

      t.timestamps null: false
    end
  end
end
