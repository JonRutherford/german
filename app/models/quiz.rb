# == Schema Information
#
# Table name: quizzes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Quiz < ActiveRecord::Base
  # attr_accessible :title, :body

  def random_next(en_to_de)

  end

  def is_correct?()

  end

  def en_to_de
  	"a"
  end

  def de_to_en
  	"b"
  end

  def mixed

  end
end