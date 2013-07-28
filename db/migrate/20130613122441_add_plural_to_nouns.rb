class AddPluralToNouns < ActiveRecord::Migration
  def change
    add_column :nouns, :plural, :string
  end
end
