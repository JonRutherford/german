class AddCreatedbyUpdatedbyToNouns < ActiveRecord::Migration
  def change
    change_table :nouns do |t|
      t.integer :updated_by_id, :created_by_id
      t.remove_index :category_id
      t.remove :category_id
    end
  end
end
