require 'test_helper'

class Web::FeedsControllerTest < ActionController::TestCase
  setup do
    client = create :client
    sign_in client

    @feed = create :feed
    @params = {id: @feed.id}
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
