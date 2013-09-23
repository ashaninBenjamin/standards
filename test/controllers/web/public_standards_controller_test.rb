require 'test_helper'

class Web::PublicStandardsControllerTest < ActionController::TestCase
  setup do
    client = create :client
    sign_in client

    @public_standard = create :standard, client: client
    @public_standard.show
    @params = {id: @public_standard.id}
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
