class CreatePluralisationRules < ActiveRecord::Migration
  def change
    create_table :pluralisation_rules do |t|
      t.references :updated_by
      t.references :created_by
      t.string :rule

      t.timestamps
    end
    add_index :pluralisation_rules, :created_by_id
    add_index :pluralisation_rules, :updated_by_id
  end
end
