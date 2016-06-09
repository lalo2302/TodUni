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
		date_birth Date.today - 20.years
	end

	factory :project do
		sequence(:name) { |n| "TEST_PROJECT_#{n}" }
		description "This project is a test"
		association user_complete

		factory :pre_project do
			status 0
		end

		factory :approved_project do
			status 1
		end

		factory :finished_project do
			status 2
		end

		factory :canceled_project do
			status 3
		end
	end
end
