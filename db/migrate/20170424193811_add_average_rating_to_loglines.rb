class AddAverageRatingToLoglines < ActiveRecord::Migration[5.0]
  def change
  	add_column :loglines, :average_rating, :integer, :default => nil
  end
end
