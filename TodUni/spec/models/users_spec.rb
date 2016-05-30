require 'rails_helper'

describe "A user" do

	it "requires a email" do
		user = User.create(email: "")
		user.valid?
		expect(user.errors[:email].any?).to eq(true)
	end
	it "accepts properly formatted email addresses" do
		emails = %w[user@example.com first.last@example.com]
		emails.each do |email|
			user = User.create(email: email)
			user.valid?
			expect(user.errors[:email].any?). to eq(false)
		end
	end
	it "rejects improperly formatted email addresses" do
		emails = %w[@ user@ @example.com .com]
		emails.each do |email|
			user = User.create(email: email)
			user.valid?
			expect(user.errors[:email].any?).to eq(true)
		end
	end

end
