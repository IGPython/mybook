require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:testuser).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a 404 on profile not found" do
  	get :show, id: "non existance"
  	assert_response :not_found
  end
  
  test "that var has been assigned on show page" do
  	get :show, id: users(:testuser).profile_name
  	assert assigns(:user)
  	assert_not_empty assigns(:statuses)
  end

  test "only shows the correct users status" do
  	get :show, id: users(:testuser).profile_name
  	assigns(:statuses).each do |status|
  		assert_equal users(:testuser), status.user
  	end
  end


end
