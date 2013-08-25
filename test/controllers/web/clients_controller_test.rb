require 'test_helper'

class Web::ClientsControllerTest < ActionController::TestCase
  setup do
    @client = create :client
    @params = {id: @client.id}
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    attrs = {}
    attrs[:client] = attributes_for(:client)
    post :create, attrs
    assert_response :redirect

    client = Client.last
    assert { client.first_name.eql? attrs[:client][:first_name] }
  end

  test "should get edit" do
    sign_in @client

    get :edit
    assert_response :success
  end

  test "should not get edit" do
    get :edit
    assert_response :redirect
  end

  test "shoud patch update" do
    sign_in @client

    @params[:client] = attributes_for(:client)
    patch :update, @params

    @client.reload
    assert { @client.first_name.eql? @params[:client][:first_name] }
  end

end
