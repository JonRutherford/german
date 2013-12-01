class RemoveCreatedByUpdatedByFromWord < ActiveRecord::Migration
  def change
    change_table :words do |t|
      t.remove :created_by_id
      t.remove :updated_by_id
    end
  end
end
