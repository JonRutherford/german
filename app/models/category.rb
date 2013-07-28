class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :nouns

  default_scope order: 'categories.name ASC'

  validates :name, presence: true, uniqueness: { case_sensitive: true }
end
