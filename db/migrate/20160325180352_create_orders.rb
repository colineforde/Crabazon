class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.integer :user_id
    	t.boolean :complete, default: false
    	t.decimal :grand_total

    	t.timestamps
    end
  end
end
