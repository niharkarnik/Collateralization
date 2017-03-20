require 'test_helper'

class InitsourcecollateralControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get initsourcecollateral_index_url
    assert_response :success
  end

end
