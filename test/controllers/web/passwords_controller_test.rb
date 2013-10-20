require 'test_helper'

class Web::PasswordsControllerTest < ActionController::TestCase
  setup do
    @client = create :client, confirmation_token: Token.generate
    @params = {confirmation_token: @client.confirmation_token}
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    attrs = {}
    attrs[:email] = @client.email
    post :create, client_new_password_type: attrs
    assert_response :redirect

    assert { ActionMailer::Base.deliveries.any? }
  end

  test "should get edit" do
    get :edit, @params
    assert_response :success
  end

  test "should put update" do
    password = generate :string
    old_password_digest = @client.password_digest
    @params[:client] = {password: password, password_confirmation: password}
    put :update, @params
    assert_response :redirect

    @client.reload
    assert { client_signed_in? }
    assert { !old_password_digest.eql? @client.password_digest}
  end

  test "should not put update" do
    password = generate :string
    @params[:client] = {password: password, password_confirmation: "wrong"}
    put :update, @params
    assert_response :success
  end

end
