require 'test_helper'

class Api::StandardsControllerTest < ActionController::TestCase
  def setup
    client = create :client
    @standard = create :standard, client: client
    @params = {id: @standard.id, format: :json}
  end

  test "should get numbers" do
    get :numbers, @params
    assert_response :success
  end
end
