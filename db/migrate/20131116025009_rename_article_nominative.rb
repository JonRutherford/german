class RenameArticleNominative < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.rename :article, :nominative
    end
  end
end
