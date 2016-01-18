require 'test_helper'

class SrsnacksControllerTest < ActionController::TestCase
  setup do
    @srsnack = srsnacks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:srsnacks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create srsnack" do
    assert_difference('Srsnack.count') do
      post :create, srsnack: { follow_count: @srsnack.follow_count, name: @srsnack.name, pchome_url: @srsnack.pchome_url, photo: @srsnack.photo }
    end

    assert_redirected_to srsnack_path(assigns(:srsnack))
  end

  test "should show srsnack" do
    get :show, id: @srsnack
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @srsnack
    assert_response :success
  end

  test "should update srsnack" do
    patch :update, id: @srsnack, srsnack: { follow_count: @srsnack.follow_count, name: @srsnack.name, pchome_url: @srsnack.pchome_url, photo: @srsnack.photo }
    assert_redirected_to srsnack_path(assigns(:srsnack))
  end

  test "should destroy srsnack" do
    assert_difference('Srsnack.count', -1) do
      delete :destroy, id: @srsnack
    end

    assert_redirected_to srsnacks_path
  end
end
