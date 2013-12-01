class AddCategoryToVerbs < ActiveRecord::Migration
  def change
    change_table :verbs do |t|
      t.references :category
    end
    add_index :verbs, :category_id
  end
end
