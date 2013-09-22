require 'test_helper'

class Web::StandardsControllerTest < ActionController::TestCase
  def setup
    @controller = Web::StandardsController.new
    user = create :client
    sign_in user
    @standard = create :standard, client: user
    @params = {id: @standard.link}
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, @params
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    post :create
    assert_response :success

    @params[:standard] = attributes_for(:one_another_standard)
    post :create, @params
    assert_response :redirect
  end

  test "should get edit" do
    get :edit, @params
    assert_response :success
  end

  test "should put update" do
    @params[:standard] = attributes_for(:standard)
    put :update, @params
    assert_response :redirect
    @standard.reload
    assert @standard
  end

end
