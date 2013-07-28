class CreateNouns < ActiveRecord::Migration
  def change
    create_table :nouns do |t|
      t.string :text
      t.string :article
      t.references :category

      t.timestamps
    end
    add_index :nouns, :category_id
  end
end
