require 'test_helper'

class Web::Admin::FeedsControllerTest < ActionController::TestCase
  setup do
    @controller = Web::Admin::FeedsController.new
    admin = create :admin
    sign_in admin

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

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    @params[:feed] = attributes_for(:feed)

    post :create, @params
    assert_response :redirect

    feed = Feed.last
    assert { @params[:feed][:title].eql? feed.title }
  end

  test "should get edit" do
    get :edit, @params
    assert_response :success
  end

  test "should patch update" do
    @params[:feed] = {title: 'Title'}

    patch :update, @params
    assert_response :redirect

    @feed.reload

    assert { @params[:feed][:title].eql? @feed.title }
  end

  test "should change state" do
    put :trigger_state_event, @params.merge(event: :publish)
    assert_response :redirect

    @feed.reload
    assert { @feed.published? }
  end
end
