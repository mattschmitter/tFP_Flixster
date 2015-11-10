require 'test_helper'

class EnrollmentsControllerTest < ActionController::TestCase
  # We want the enrollment to be stored database.
  # We want the user to be redirected to the course detail page.

  test "enroll not signed in" do
  	course = FactoryGirl.create(:course)
  	assert_no_difference "Enrollment.count" do
  		post :create, :course_id => course.id
  	end

  	assert_redirected_to new_user_session_path
  end

  test "create a new enrollment" do
  	user = FactoryGirl.create(:user)
  	sign_in user

  	course = FactoryGirl.create(:course)
  	assert_difference "Enrollment.count" do
  		post :create, :course_id => course.id
  	end

  	assert_redirected_to course_path(course)
  end
end
