# == Schema Information
#
# Table name: email_verifications
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  token      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class EmailVerificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
