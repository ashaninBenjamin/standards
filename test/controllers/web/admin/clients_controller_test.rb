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

  test "should get edit" do
    get :edit, @params
    assert_response :success
  end

  test "should patch udpate" do
    @params[:client] = {first_name: generate(:first_name) }

    patch :update, @params
    assert_response :redirect

    @client.reload
    assert { @params[:client][:first_name].eql? @client.first_name }
  end

  test "should state update" do
    put :trigger_state_event, @params.merge(event: :del)
    assert_response :redirect

    @client.reload
    assert { @client.deleted? }
  end

end
