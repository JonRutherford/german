class AddIndexToCategorisationsCategoryNoun < ActiveRecord::Migration
  def change
    add_index :categorisations, [:category_id, :noun_id], unique: true
  end
end
