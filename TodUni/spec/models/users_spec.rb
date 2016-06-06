require "rails_helper"

RSpec.describe User, :type => :model do

	it "has a valid factory" do
		expect(build(:user)).to be_valid
	end

	describe "Validations" do
			
		it "requires a name" do
			user = User.new(name:"")

			user.valid? # populates the errors
			expect(user.errors[:name].any?).to eq(true)
		end

		it "requires an email" do
			user = User.new(email:"")

			user.valid?
			expect(user.errors[:email].any?).to eq(true)
		end

		it "accepts properly formatted email address" do
			emails = %w[user@example.com test.user@ex.c]
			emails.each do |e|
				user = User.new(email:e)

				user.valid?
				expect(user.errors[:email].any?).to eq(false)
			end
		end

		it "rejects improperly formatted email address" do
			emails = %w[u.c u@@c y@.c user@ @com example e@a@ex.com e.@com]
			emails.each do |e|
				user = User.new(email:e)

				user.valid?
				expect(user.errors[:email].any?).to eq(true)
			end
		end

		it "requires a unique, case insensitive email address" do
			user1 = User.create!(user_attributes)
			user2 = User.new(email: user1.email.upcase)

			user2.valid?
			expect(user2.errors[:email].any?).to eq(true)
		end

		it "requires a password" do
			user = User.new(password:"")

			user.valid?
			expect(user.errors[:password].any?).to eq(true)
		end
	end
end
