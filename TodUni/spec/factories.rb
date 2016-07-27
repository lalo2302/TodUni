FactoryGirl.define do
	factory :project do
		sequence(:name) { |n| "TEST_PROJECT_#{n}" }
		description "This project is a test"
    status 0

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

	factory :user do
		sequence(:email) { |n| "example#{n}@example.com" }
		password "12345678"
		password_confirmation "12345678"

    factory :user_complete do
      name "Example"
      date_birth Date.today - 20.years
      after :create do |user|
        user.update_column(:avatar, 'spec/support/valid_image.jpg')
      end

      factory :user_with_project do
        after(:create) do |user|
          project = FactoryGirl.create(:project)
          user.own_project project
        end
      end
    end
	end	
end
