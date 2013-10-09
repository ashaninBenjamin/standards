require 'test_helper'

class Web::SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should authenticate" do
    attrs = {}
    client = create :client
    attrs[:email] = client.email
    attrs[:password] = client.password
    post :create, client_sign_in_type: attrs
    assert_response :redirect
    assert { client_signed_in? }
  end

  test "should not authenticate" do
    attrs = {}
    client = create :client
    attrs[:email] = client.email
    attrs[:password] = 'wrong_password'
    post :create, client_sign_in_type: attrs
    assert_response :success
    assert { !client_signed_in? }
  end

  test "should sing out" do
    client = create :client
    sign_in client
    delete :destroy
    assert_response :redirect
    assert { !client_signed_in? }
  end

end
