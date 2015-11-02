FactoryGirl.define do  

	factory :user do
		sequence :email do |n|
			"email#{n}@emial.com"
		end
		password "pswrd12345678"
		password_confirmation "pswrd12345678"
	end

	factory :course do
		# sequence :title do |n|
		# 	"Test Course #{n}"
		# end
		title "Title"
		description "This is the description"
		cost "100.00"
	end

	factory :section do
    	title "Section Title"
    end

end