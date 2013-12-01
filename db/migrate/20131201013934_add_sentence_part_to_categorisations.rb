class AddSentencePartToCategorisations < ActiveRecord::Migration
  def up
    change_table :categorisations do |t|
      t.references :sentence_part, polymorphic: true
    end

    Categorisation.all.each do |c|
      c.sentence_part_id = c.noun_id
      c.sentence_part_type = Noun
      c.save!
    end

    change_table :categorisations do |t|
      t.remove :noun_id
    end
  end

  def down
    change_table :categorisations do |t|
      t.references :noun
    end

    Categorisation.all.each do |c|
      if c.sentence_part_type == Noun
        c.noun_id = c.sentence_part_id
        c.save!
      else
        Categorisation.delete(c)
      end
    end

    change_table :categorisations do |t|
      t.remove :sentence_part
    end
  end
end
