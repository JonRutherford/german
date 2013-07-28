class AddTranslationsToNouns < ActiveRecord::Migration
  def up
  	remove_column :nouns, :text
    add_column :nouns, :english, :string
    add_column :nouns, :german, :string
  end

  def down
  	add_column :nouns, :text, :string
  	remove_column :nouns, :english
  	remove_column :nouns, :german
  end
end
