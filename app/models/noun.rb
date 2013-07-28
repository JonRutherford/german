class Noun < ActiveRecord::Base
  belongs_to :category
  belongs_to :article
  attr_accessible :category_id, :article_id, :english, :german, :plural, :notes

  validates :category_id, presence: true
  validates :article_id, presence: true
  validates :english, presence: true, uniqueness: { scope: :german, case_sensitive: true }
  validates :german, presence: true, uniqueness: { case_sensitive: true }
  				   # format: { with: /\A[A-Z][a-z]+\z/ }

  def self.random(n=1)
    ids = ActiveRecord::Base.connection.select_values("select id from #{self.to_s.pluralize}").sample(n)
    res = where(id: ids)
    return n == 1 ? res.first : res
  end

  def self.search(search, page)
  	search_cond = "%#{search}%"
    paginate per_page: 30, page: page,
             conditions: ['english LIKE ? OR german LIKE ?', search_cond, search_cond],
             order: 'english'
  end
end
