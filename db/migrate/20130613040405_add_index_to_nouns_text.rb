class AddIndexToNounsText < ActiveRecord::Migration
  def change
  	add_index :nouns, :text, unique: true
  end
end
