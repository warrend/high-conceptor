class CreateLoglineCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :logline_categories do |t|
      t.references :logline, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
