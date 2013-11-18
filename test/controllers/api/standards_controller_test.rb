require 'test_helper'

class Api::StandardsControllerTest < ActionController::TestCase
  def setup
    client = create :client
    @standard = create :standard, client: client
    @params = {id: @standard.id, format: :json}
  end

  test "should get numbers" do
    get :numbers, @params
    assert_response :success
  end

  test "should post create" do
    standard_attr = attributes_for(:standard)
    post :create, standard: standard_attr, format: :json
    assert_response :success
    assert { standard_attr[:name].eql? session[:standard][:name] }
  end

  test "should put update" do
    attrs = {name: 'new_name'}
    put :update, id: @standard.id, standard: attrs, format: :json
    assert_response :success
    @standard.reload
    assert { 'new_name'.eql? @standard.name }
  end
end
