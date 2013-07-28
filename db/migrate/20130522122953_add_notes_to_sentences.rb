class AddNotesToSentences < ActiveRecord::Migration
  def change
    add_column :sentences, :notes, :string
  end
end
