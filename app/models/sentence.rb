class Sentence < ActiveRecord::Base
  attr_accessible :english, :german, :literal_translation, :notes

  validates :english, presence: true
  validates :german, presence: true

  default_scope order: 'sentences.created_at DESC'

  def self.random(n=1)
  	# return first(offset: rand(count())) if n == 1
  	ids = ActiveRecord::Base.connection.select_values("select id from #{self.to_s.pluralize}").sample(n)
    res = where(id: ids)
  	return n == 1 ? res.first : res
  end
end
