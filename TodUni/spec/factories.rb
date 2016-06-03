FactoryGirl.define do
	factory :user do
		email "example@example.com"
		password "12345678"
		password_confirmation "12345678"
	end	

	factory :user_complete, class: User do
		email "example@example.com"
		name "Example"
		password "12345678"
		password_confirmation "12345678"
		birth_date Date.today - 20.years
	end

	factory :project do
		name "Project example"
		description "Project description"
		assosiation user_complete
	end
end
