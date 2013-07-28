class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :article

      t.timestamps
    end
  end
end
