require 'test_helper'

class Web::HelpsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    post :create, help_type: attributes_for(:help_type)
    assert_response :redirect

    assert { ActionMailer::Base.deliveries.any? }
  end
end
