require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end

  test "should be redirected when not loged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should render a new page" do
    sign_in users(:testuser)
    get :new
    assert :success
  end

  test "user can sign in" do
    sign_in users(:testuser)
    get :new
    assert :success
  end

  test "should be loged in to post a status" do
    post :create, status: {content: "hello"}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should be logged in to edit a post" do
    put :update, id: @status, status: { content: @status.content }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end


  test "should create status" do
    sign_in users(:testuser)
      assert_difference('Status.count') do
      post :create, status: { content: @status.content, user_id: @status.user_id}
    end
    assert_redirected_to status_path(assigns(:status))
  end

  test "should create status for current user when logged in" do
    sign_in users(:testuser)
      assert_difference('Status.count') do
        post :create, status: { content: @status.content, user_id: users(:testuser2).id}
    end
    assert_redirected_to status_path(assigns(:status))
    assert_equal assigns(:status).user_id, users(:testuser).id
  end


  test "should show status" do
    get :show, id: @status
    assert_response :success
  end

  test "should be logged in to get edit" do
    sign_in users(:testuser)
    get :edit, id: @status
    assert_response :success
  end


  test "should be redirected if trying to edit and not signed in " do
    get :edit, id: @status
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should update status" do
    sign_in users(:testuser)
    put :update, id: @status, status: { content: @status.content }
    assert_redirected_to status_path(assigns(:status))
  end

  test "should update status for the current user when logged in" do
    sign_in users(:testuser)
    put :update, id: @status, status: { content: @status.content, user_id: users(:testuser2).id}
    assert_redirected_to status_path(assigns(:status))
    assert_equal assigns(:status).user_id, users(:testuser).id
  end

  test "should not updtae the status when nothing changes" do
    sign_in users(:testuser)
    put :update, id: @status 
    assert_redirected_to status_path(assigns(:status))
    assert_equal assigns(:status).user_id, users(:testuser).id
  end


  test "should destroy status" do
    assert_difference('Status.count', -1) do
      delete :destroy, id: @status
    end

    assert_redirected_to statuses_path
  end
end
