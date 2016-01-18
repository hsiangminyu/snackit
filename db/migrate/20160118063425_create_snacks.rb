class CreateSnacks < ActiveRecord::Migration
  def change
    create_table :snacks do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
