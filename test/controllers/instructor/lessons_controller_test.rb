require 'test_helper'

class Instructor::LessonsControllerTest < ActionController::TestCase

# Look up the section in the database the lesson is for.
# Create the lesson in the database and connect it to the section we looked up.
# Redirect the user to the instructor dashboard.
	test "new lesson" do
		user = FactoryGirl.create(:user)
		sign_in user

		course = FactoryGirl.create(:course, :user => user)
		section = FactoryGirl.create(:section, :course => course)

		assert_difference "section.lessons.count" do
			post :create, :section_id => section.id, :lesson => {title: "Lesson title",
				subtitle: "Lesson subtitle"}
		end

		assert_redirected_to instructor_course_path(section.course)

		assert_equal 1, Lesson.count

	end

	test "new lesson dif user" do

		user = FactoryGirl.create(:user)
		sign_in user

		course = FactoryGirl.create(:course)
		section = FactoryGirl.create(:section, :course => course)
		get :new, :section_id => section.id
		assert_response :unauthorized

	end


end
