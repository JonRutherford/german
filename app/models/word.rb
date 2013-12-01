class Word < ActiveRecord::Base
  attr_accessible :english, :german, :notes
  validates :english, presence: true, uniqueness: { scope: :german, case_sensitive: true }
  validates :german, presence: true, uniqueness: { case_sensitive: true }
end
