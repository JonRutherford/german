class AddLiteralTranslationToSentences < ActiveRecord::Migration
  def change
    add_column :sentences, :literal_translation, :string
  end
end
