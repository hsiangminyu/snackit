class RanameFollowingCountToFavoriteCount < ActiveRecord::Migration
  def change
  	rename_column :srsnacks, :follow_count, :favorite_count
  end
end
