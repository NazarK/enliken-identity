require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get brillig" do
    get :brillig
    assert_response :success
  end

end
