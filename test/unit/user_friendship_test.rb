require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase

 	should belong_to(:user)
 	should belong_to(:friend)	

	test "that creating a firendship works without raising an exception" do
		assert_nothing_raised do
			UserFriendship.create user: users(:testuser), friend: users(:mikethefrog)
		end
	end

	test "that creating a friendship based on user id and friend id works" do
		UserFriendship.create user_id: users(:testuser).id, friend_id: users(:mikethefrog).id
		assert users(:testuser).friends.include?(users(:mikethefrog))
	end
end
