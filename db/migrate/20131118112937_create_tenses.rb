class CreateTenses < ActiveRecord::Migration
  def change
    create_table :tenses do |t|
      t.string :first_person_singular
      t.string :first_person_plural
      t.string :second_person_informal
      t.string :second_person_plural
      t.string :second_person_plural_formal
      t.string :third_person_singular
      t.string :third_person_plural

      t.timestamps
    end
  end
end
