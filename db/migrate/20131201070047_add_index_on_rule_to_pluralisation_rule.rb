class AddIndexOnRuleToPluralisationRule < ActiveRecord::Migration
  def change
    add_index :pluralisation_rules, :rule, unique: true
  end
end
