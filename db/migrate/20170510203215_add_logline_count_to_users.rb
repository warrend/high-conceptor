class AddLoglineCountToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :logline_count, :integer, :default => 0
  end
end
