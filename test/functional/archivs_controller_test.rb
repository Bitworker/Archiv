require 'test_helper'

class ArchivsControllerTest < ActionController::TestCase
  setup do
    @archiv = archivs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:archivs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create archiv" do
    assert_difference('Archiv.count') do
      post :create, archiv: @archiv.attributes
    end

    assert_redirected_to archiv_path(assigns(:archiv))
  end

  test "should show archiv" do
    get :show, id: @archiv
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @archiv
    assert_response :success
  end

  test "should update archiv" do
    put :update, id: @archiv, archiv: @archiv.attributes
    assert_redirected_to archiv_path(assigns(:archiv))
  end

  test "should destroy archiv" do
    assert_difference('Archiv.count', -1) do
      delete :destroy, id: @archiv
    end

    assert_redirected_to archivs_path
  end
end
