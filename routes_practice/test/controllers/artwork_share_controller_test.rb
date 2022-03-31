require 'test_helper'

class ArtworkShareControllerTest < ActionDispatch::IntegrationTest
  test "should get :create" do
    get artwork_share_:create_url
    assert_response :success
  end

  test "should get :destroy" do
    get artwork_share_:destroy_url
    assert_response :success
  end

  test "should get :index" do
    get artwork_share_:index_url
    assert_response :success
  end

  test "should get :show" do
    get artwork_share_:show_url
    assert_response :success
  end

end
