# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  email                  :string(255)
#  user_name              :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  admin                  :boolean          default(FALSE)
#  remember_token         :string(255)
#  password_digest        :string(255)
#

require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end
