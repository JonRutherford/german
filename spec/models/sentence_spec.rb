# == Schema Information
#
# Table name: sentences
#
#  id                  :integer          not null, primary key
#  english             :string(255)
#  german              :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  literal_translation :string(255)
#  notes               :string(255)
#

require 'spec_helper'

describe Sentence do
  pending "add some examples to (or delete) #{__FILE__}"
end
