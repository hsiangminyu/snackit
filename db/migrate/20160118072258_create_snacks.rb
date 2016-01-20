class CreateSnacks < ActiveRecord::Migration
  def change
    create_table :snacks do |t|
      t.string :name
	  t.integer :favorite_count
      t.string :photo

      t.timestamps null: false
    end
  end
end
