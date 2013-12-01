class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :english
      t.string :german
      t.string :notes
      t.references :created_by
      t.references :updated_by

      t.timestamps
    end
    add_index :words, :created_by_id
    add_index :words, :updated_by_id
  end
end
