FactoryGirl.define do  factory :enrollment do
    
  end
  factory :lesson do
    
  end
  

	factory :user do
		sequence :email do |n|
			"email#{n}@email.com"
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
		cost 100.00
		association :user
	end

	factory :section do
    	title "Section Title"
    	association :course
    end

end