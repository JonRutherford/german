class Tense < ActiveRecord::Base
  attr_accessible :first_person_plural, :first_person_singular, 
                  :second_person_informal, :second_person_plural, 
                  :second_person_plural_formal, :third_person_plural, 
                  :third_person_singular

  validates :first_person_singular, presence: true
  validates :first_person_plural, presence: true
  validates :second_person_informal, presence: true
  validates :second_person_plural, presence: true
  validates :second_person_plural_formal, presence: true
  validates :third_person_plural, presence: true
  validates :third_person_singular, presence: true
end
