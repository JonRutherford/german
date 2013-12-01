# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :categorisations
  has_many :sentence_parts, through: :categorisations

  default_scope order: 'categories.name ASC'

  validates :name, presence: true, uniqueness: { case_sensitive: true }

  def name_and_count_noun
    "#{self.name} (#{Categorisation.where(sentence_part_type: Noun, category_id: self.id).count})"
  end
end
