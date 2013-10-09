require 'test_helper'

class Web::PublicStandardsControllerTest < ActionController::TestCase
  setup do
    client = create :client
    sign_in client
    another_client = create :client

    @public_standard = create :standard, client: another_client
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

  test "should post copy" do
    post :copy, @params
    assert_response :redirect

    standard = Standard.last
    assert { @public_standard.id != standard.id }
  end

end
