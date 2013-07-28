class AddNotesToNouns < ActiveRecord::Migration
  def change
  	add_column :nouns, :notes, :string
  end
end
