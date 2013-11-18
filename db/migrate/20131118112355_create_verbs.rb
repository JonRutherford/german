class CreateVerbs < ActiveRecord::Migration
  def change
    create_table :verbs do |t|
      t.string :english
      t.string :german
      t.string :notes

      t.timestamps
    end
  end
end
