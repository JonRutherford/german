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

require 'spec_helper'

describe Noun do
  pending "add some examples to (or delete) #{__FILE__}"
end
