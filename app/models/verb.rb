class Verb < ActiveRecord::Base
  has_many :categories, through: :categorisations
  has_many :categorisations, as: :sentence_part, dependent: :destroy
  belongs_to :updated_by, class_name: :User
  belongs_to :created_by, class_name: :User
  belongs_to :present_tense, class_name: :Tense, dependent: :destroy
  belongs_to :infinitive, class_name: :Word, dependent: :destroy
  accepts_nested_attributes_for :infinitive, allow_destroy: true
  accepts_nested_attributes_for :present_tense, allow_destroy: true

  attr_accessible :updated_by, :created_by, :present_tense_attributes, 
                  :infinitive_attributes, :category_ids

  validates :updated_by, presence: true
  validates :created_by, presence: true
  validates :present_tense, presence: true
  validates :infinitive, presence: true
  validates :categories, presence: true

  # for removing blank values from array (useful for collection_select bug)        
  # before_validation do |verb|
  #   verb.categories.reject!(&:blank?) if verb.categories
  # end

  def self.random(n=1)
    ids = ActiveRecord::Base.connection.select_values("select id from #{self.to_s.pluralize}").sample(n)
    res = where(id: ids)
    return n == 1 ? res.first : res
  end

  def self.search(search, page)
    search_cond = "%#{search}%"
    paginate per_page: 30, page: page,
             conditions: ['words.english LIKE ? OR words.german LIKE ?', search_cond, search_cond],
             joins: :infinitive,
             order: 'english'
  end

  def infinitive_attributes=(attributes)
    self.infinitive ||= Word.new
    self.infinitive.update_attributes(attributes)
  end

  def present_tense_attributes=(attributes)
    self.present_tense ||= Tense.new
    self.present_tense.update_attributes(attributes)
  end
end
