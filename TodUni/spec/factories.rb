FactoryGirl.define do
	factory :user do
		email "example@example.com"
		name "Example"
		password "12345678"
		password_confirmation "12345678"
	end	

	factory :project do
		name "Project example"
		description "Project description"
		assosiation user
	end
end
