require 'test_helper'

class Pdf::StandardsControllerTest < ActionController::TestCase
  def setup
    user = create :client
    sign_in user
    @standard = create :standard, client: user
    @params = {id: @standard.link}
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, @params
    assert_response :success
  end

end
