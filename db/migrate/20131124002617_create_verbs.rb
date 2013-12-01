class CreateVerbs < ActiveRecord::Migration
  def change
    create_table :verbs do |t|
      t.references :updated_by
      t.references :created_by
      t.references :present_tense
      t.references :infinitive

      t.timestamps
    end
    add_index :verbs, :updated_by_id
    add_index :verbs, :created_by_id
    add_index :verbs, :present_tense_id
    add_index :verbs, :infinitive_id
  end
end
