class CreateSrsnacks < ActiveRecord::Migration
  def change
    create_table :srsnacks do |t|
      t.string :name
      t.integer :follow_count
      t.string :photo
      t.string :pchome_url

      t.timestamps null: false
    end
  end
end
