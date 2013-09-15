require 'test_helper'

class Web::Admin::SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should authenticate" do
    attrs = {}
    admin = create :admin
    attrs[:email] = admin.email
    attrs[:password] = admin.password
    post :create, admin_sign_in_type: attrs
    assert_response :redirect
    assert { admin_signed_in? }
  end

  test "should not authenticate" do
    attrs = {}
    admin = create :admin
    attrs[:email] = admin.email
    attrs[:password] = 'wrong_password'
    post :create, admin_sign_in_type: attrs
    assert_response :success
    assert { !admin_signed_in? }
  end

  test "should sing out" do
    admin = create :admin
    sign_in admin
    delete :destroy
    assert_response :redirect
    assert { !admin_signed_in? }
  end

end
