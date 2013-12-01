# == Schema Information
#
# Table name: nouns
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  notes         :string(255)
#  article_id    :integer
#  english       :string(255)
#  german        :string(255)
#  plural        :string(255)
#  updated_by_id :integer
#  created_by_id :integer
#

class Noun < ActiveRecord::Base
  has_many :categories, through: :categorisations
  has_many :categorisations, as: :sentence_part, dependent: :destroy
  belongs_to :article
  belongs_to :updated_by, class_name: :User
  belongs_to :created_by, class_name: :User
  attr_accessible :category_ids, :categorisations, :article_id, :english, :german, :plural, :notes,
    :updated_by, :created_by

  validates :english, presence: true, uniqueness: { scope: :german, case_sensitive: true }
  validates :german, presence: true, uniqueness: { case_sensitive: true }
  # format: { with: /\A[A-Z][a-z]+\z/ }
  validates :article, presence: true
  validates :updated_by, presence: true
  validates :created_by, presence: true
  validates :categories, presence: true
  	
  # for removing blank values from array (useful for collection_select bug)			   
  # before_validation do |noun|
  #   noun.category_ids.reject!(&:blank?) if noun.category_ids
  # end

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
