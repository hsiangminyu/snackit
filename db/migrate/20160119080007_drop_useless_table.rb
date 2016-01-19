class DropUselessTable < ActiveRecord::Migration
  def change
  	drop_table :snacks
  end
end
