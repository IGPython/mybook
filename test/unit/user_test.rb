require 'test_helper'

class UserTest < ActiveSupport::TestCase

  should have_many(:user_friendships)
  should have_many(:friends)

  test "a user should enter a first name" do 
  	user= User.new
  	assert !user.save	
  	assert !user.errors[:first_name].empty?
  end

  test "a profile name should not be blank" do
  	user= User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user has entered his last name" do
  	user= User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "user should have a unique profile name" do
  	user= User.new
  	user.profile_name = users(:testuser).profile_name
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "no spaces in profile name" do
  	user = User.new
  	user.profile_name = "My new name"
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

  test "check the profile name is formatted" do
    user = User.new(first_name: 'mike', last_name: 'smith', email:'swparsksey@hotmail.com',)
    user.password = user.password_confirmation = "ajhgjgjgjhgkj876876"
    user.profile_name = "mikeysmith"
    assert user.valid?
  end

  test " that no error is raised when accessing the users friend" do
    assert_nothing_raised do
      users(:testuser).friends
    end
  end

  test "that creating a friendshop on a user works" do
    users(:testuser).friends << users(:mikethefrog)
    users(:testuser).friends.reload
    assert users(:testuser).friends.include?(users(:mikethefrog))
  end


end


