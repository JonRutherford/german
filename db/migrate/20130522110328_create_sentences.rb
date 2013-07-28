class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.string :english
      t.string :german

      t.timestamps
    end
  end
end
