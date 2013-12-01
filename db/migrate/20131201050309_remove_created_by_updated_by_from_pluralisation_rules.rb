class RemoveCreatedByUpdatedByFromPluralisationRules < ActiveRecord::Migration
  def change
    change_table :pluralisation_rules do |t|
      t.remove :created_by_id
      t.remove :updated_by_id
    end
  end
end
