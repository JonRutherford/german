class Article < ActiveRecord::Base
  attr_accessible :article

  has_many :nouns

  validates :article, presence: true, uniqueness: { case_sensitive: true }
end
