require 'test_helper'

class Instructor::CoursesControllerTest < ActionController::TestCase
	test "create a course not signed in" do
		assert_no_difference "Course.count" do
			post :create, {:course => {
				:title => "Test1",
				:description => "This is the description",
				:cost => "100.00"
				}
			}
		end

		assert_redirected_to new_user_session_path
	end

	test "create a course success" do
		# user = FactoryGirl.create(:user)
		# sign_in user

		# assert_difference "Course.count" do
		# 	post :create, {:course => {
		# 		:title => "Test1",
		# 		:description => "This is the description",
		# 		:cost => "100.00"
		# 		}
		# 	}
		# end
		# assert_redirected_to instructor_course_path(@course)

		# assert_equal 1, user.courses.count

	end


end
