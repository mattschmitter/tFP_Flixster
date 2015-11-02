require 'test_helper'

class Instructor::SectionsControllerTest < ActionController::TestCase
	
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

	# 	assert_equal 1, user.courses.sections.count 
	# end

end
