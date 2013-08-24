require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  test "that the /login route opens the login page" do 
  	get '/signin'
  	assert_response :success
  end


 test "that a profile page works" do
 	get '/testuser'
 	assert_response :success
 end


end
