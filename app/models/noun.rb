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
  belongs_to :pluralisation_rule
  attr_accessible :category_ids, :article_id, :english, :german, 
                  :pluralisation_rule_id, :notes, :updated_by, :created_by

  validates :english, presence: true, uniqueness: { scope: :german, case_sensitive: true }
  validates :german, presence: true, uniqueness: { case_sensitive: true }
  # format: { with: /\A[A-Z][a-z]+\z/ }
  validates :article, presence: true
  validates :updated_by, presence: true
  validates :created_by, presence: true
  validates :categories, presence: true
  validates :pluralisation_rule, presence: true
  	
  # for removing blank values from array (useful for collection_select bug)			   
  # before_validation do |noun|
  #   noun.category_ids.reject!(&:blank?) if noun.category_ids
  # end

  def self.random(category=Category.first)
    res = includes(:categories).where(categories: {id: category.id})
    #ids = ActiveRecord::Base.connection.select_values("select id from #{self.to_s.pluralize}").sample(n)
    #res = includes(:categories).where(nouns: {id: ids}, categories: {id: category_id})
    #res = includes(:categories).where("categories.id" => category_id).and(id: id)
    #res = joins(:categories).where(id: ids, categories: { id: category_id} )
    return res.sample(1).first
  end



  def self.search(search, page)
  	search_cond = "%#{search}%"
    paginate per_page: 30, page: page,
             conditions: ['english LIKE ? OR german LIKE ?', search_cond, search_cond],
             order: 'english'
  end
end
