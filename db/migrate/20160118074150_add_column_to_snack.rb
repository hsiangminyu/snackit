class AddColumnToSnack < ActiveRecord::Migration
  def change
  	add_column :snacks, :follow_count, :integer
  	add_column :snacks, :photo, :string
  	add_column :snacks, :pchome_url, :string
  	add_column :snacks, :isFinished, :boolean
  end
end
