require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  
  test "user must have a name" do 
  	status = Status.new
  	assert !status.save
  	assert !status.errors[:user_id].empty?
  end

  test "User must post a status not leave empty" do
  	status = Status.new
  	assert !status.save
  	assert !status.errors[:content].empty?
  end
end
