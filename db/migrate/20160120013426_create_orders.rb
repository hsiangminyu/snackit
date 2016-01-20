class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :snack_id

      t.timestamps null: false
    end
  end
end
