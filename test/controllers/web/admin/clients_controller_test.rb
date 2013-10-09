require 'test_helper'

class Web::Admin::ClientsControllerTest < ActionController::TestCase
  setup do
    admin = create :admin
    sign_in admin
    @client = create :client
    @params = {id: @client.id}
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should state update" do
    put :trigger_state_event, @params.merge(event: :del)
    assert_response :redirect

    @client.reload
    assert { @client.deleted? }
  end

end
