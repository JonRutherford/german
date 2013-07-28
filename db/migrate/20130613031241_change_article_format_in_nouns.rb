class ChangeArticleFormatInNouns < ActiveRecord::Migration
  def up
  	remove_column :nouns, :article
  	change_table :nouns do |t|
      t.references :article
    end
  end

  def down
  	remove_column :nouns, :article_id
  	add_column :nouns, :article, :string
  end
end
