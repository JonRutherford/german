# == Schema Information
#
# Table name: categorisations
#
#  id          :integer          not null, primary key
#  category_id :integer
#  noun_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Categorisation < ActiveRecord::Base
  belongs_to :category
  belongs_to :noun
  attr_accessible :category, :noun

  validates :category_id, presence: true
  validates :noun_id, presence: true, uniqueness: { scope: :category_id }
end
