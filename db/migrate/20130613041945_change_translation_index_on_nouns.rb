class ChangeTranslationIndexOnNouns < ActiveRecord::Migration
  def up
  	add_index :nouns, [:english, :german], unique: true
  end

  def down
  	remove_index :nouns, [:english, :german]
  end
end
