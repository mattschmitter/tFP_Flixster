require 'test_helper'

class Instructor::CoursesControllerTest < ActionController::TestCase
	test "create a course not signed in" do
		course = FactoryGirl.create(:course)
		assert_no_difference "Course.count" do
			post :create, :course => course
		end

		assert_redirected_to new_user_session_path
	end

	# test "create a course success" do
	# 	user = FactoryGirl.create(:user)
	# 	sign_in user

	# 	course = FactoryGirl.create(:course, :user => user)

	# 	assert_difference "Course.count" do
	# 		post :create, :course => course
	# 	end

	# 	assert_redirected_to instructor_course_path(course)

	# 	assert_equal 1, user.courses.count

	# end


end