class RenameSrsnacksToSnacks < ActiveRecord::Migration
  def change
  	rename_table :srsnacks, :snacks
  end
end
