require 'test_helper'

class Instructor::CoursesControllerTest < ActionController::TestCase
	test "create a course not signed in" do
		course = FactoryGirl.create(:course)
		assert_no_difference "Course.count" do
			post :create, :course => {title: course.title, description: course.description, cost: course.cost}
		end

		assert_redirected_to new_user_session_path
	end

	test "create a course success" do
		user = FactoryGirl.create(:user)
		sign_in user

		# course = FactoryGirl.create(:course, :user => user)

		assert_difference "Course.count" do
			post :create, :course => {
				title: "Title", 
				description: "Description", 
				cost: 100}
		end

		assert_redirected_to instructor_course_path(Course.last)

		assert_equal 1, user.courses.count

	end


	# test "create new section" do
	# 	user = FactoryGirl.create(:user)
	# 	sign_in user

	# 	course = FactoryGirl.create(:course, :user => user)

	# 	assert_difference 'Section.count' do
	# 		section_attributes = FactoryGirl.attributes_for(:section, :course => course, :user => user)
	# 		post :create, :course_id => course.id, section: section_attributes 
	# 	end

	# 	course = Course.last
	# 	assert_redirected_to instructor_course_path(course.id)

	# 	assert_equal 1, course.sections.count 
	# end

	test "create new section not signed in" do
		course = FactoryGirl.create(:course)

		assert_no_difference "course.sections.count" do
			section_attributes = FactoryGirl.attributes_for(:section, :course => course)
			post :create, :course_id => course.id, section: section_attributes 
		end

		assert_redirected_to new_user_session_path
	end

end
