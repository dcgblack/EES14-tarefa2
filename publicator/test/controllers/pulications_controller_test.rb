require 'test_helper'

class PulicationsControllerTest < ActionController::TestCase
  setup do
    @pulication = pulications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pulications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pulication" do
    assert_difference('Pulication.count') do
      post :create, pulication: { authors: @pulication.authors, nature: @pulication.nature, organizer: @pulication.organizer, reach: @pulication.reach, type: @pulication.type, vehicle: @pulication.vehicle }
    end

    assert_redirected_to pulication_path(assigns(:pulication))
  end

  test "should show pulication" do
    get :show, id: @pulication
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pulication
    assert_response :success
  end

  test "should update pulication" do
    patch :update, id: @pulication, pulication: { authors: @pulication.authors, nature: @pulication.nature, organizer: @pulication.organizer, reach: @pulication.reach, type: @pulication.type, vehicle: @pulication.vehicle }
    assert_redirected_to pulication_path(assigns(:pulication))
  end

  test "should destroy pulication" do
    assert_difference('Pulication.count', -1) do
      delete :destroy, id: @pulication
    end

    assert_redirected_to pulications_path
  end
end
