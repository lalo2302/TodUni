FactoryGirl.define do
	factory :user do
		email "example@example.com"
		name "Example"
		password "12345678"
		password_confirmation "12345678"
		birth_date Date.today - 20.year
	end	
end
