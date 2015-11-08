require 'test_helper'

class Instructor::SectionsControllerTest < ActionController::TestCase
	
	test "create new section" do
		user = FactoryGirl.create(:user)
		sign_in user

		course = FactoryGirl.create(:course, :user => user)

		assert_difference 'Section.count' do
			section_attributes = FactoryGirl.attributes_for(:section, :course => course, :user => user)
			post :create, :course_id => course.id, section: section_attributes 
		end

		course = Course.last
		assert_redirected_to instructor_course_path(course.id)

		assert_equal 1, course.sections.count 
	end

	test "create new section not signed in" do
		course = FactoryGirl.create(:course)

		assert_no_difference "course.sections.count" do
			section_attributes = FactoryGirl.attributes_for(:section, :course => course)
			post :create, :course_id => course.id, section: section_attributes 
		end

		assert_redirected_to new_user_session_path
	end


	# Test out this change worked, by trying to navigate to 
	# the page to add a section for a course you didn't create. 
	# If everything worked, you'll see an "unauthorized" error message.

	test "add section to course you didn't create" do
		user = FactoryGirl.create(:user)
		sign_in user

		course = FactoryGirl.create(:course)

		get :new, :course_id => course.id
		assert_response :unauthorized

	end

end
