class AddUserLoglineUniquenessToRatings < ActiveRecord::Migration[5.0]
  def change
  	add_index :ratings, [:user_id, :logline_id], unique: true
  end
end
