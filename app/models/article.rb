# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  nominative :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ActiveRecord::Base
  attr_accessible :nominative

  has_many :nouns

  validates :nominative, presence: true, uniqueness: { case_sensitive: true }
end
