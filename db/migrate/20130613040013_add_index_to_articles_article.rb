class AddIndexToArticlesArticle < ActiveRecord::Migration
  def change
  	add_index :articles, :article, unique: true
  end
end
