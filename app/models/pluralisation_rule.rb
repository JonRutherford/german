class PluralisationRule < ActiveRecord::Base
  attr_accessible :rule

  validates :rule, presence: true, uniqueness: { case_sensitive: true }

  default_scope order: 'pluralisation_rules.rule ASC'
end
