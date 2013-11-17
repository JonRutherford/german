class CreateCategorisations < ActiveRecord::Migration
  def change
    create_table :categorisations do |t|
      t.references :category
      t.references :noun

      t.timestamps
    end
    add_index :categorisations, :category_id
    add_index :categorisations, :noun_id
  end
end
