require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '#main .entry', minimum: 2
    assert_select 'h3', 'programming ruby'
    assert_select '.price', /\$[,\d]+\.\d\d/

  end

end
