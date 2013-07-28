class AddIndexToSentenceCreatedAt < ActiveRecord::Migration
  def change
  	add_index :sentences, :created_at, unique: true
  end
end
