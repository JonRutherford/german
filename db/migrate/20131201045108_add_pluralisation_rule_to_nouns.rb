class AddPluralisationRuleToNouns < ActiveRecord::Migration
  def change
    change_table :nouns do |t|
      t.integer :pluralisation_rule_id
      t.remove :plural
    end
  end
end
