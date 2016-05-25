require 'rails_helper'

describe "A user" do

	it "requires a name" do
		user = User.new(name: "")
		user.valid?
		expect(user.errors[:name].any?).to eq(true)
	end
	it "requires a email" do
		user = User.new(email: "")
		user.valid?
		expect(user.errors[:email].any?).to eq(true)
	end
	it "accepts properly formatted email addresses" do
		emails = %w[user@example.com first.last@example.com]
		emails.each do |email|
			user = User.new(email: email)
			user.valid?
			expect(user.errors[:email].any?). to eq(true)
		end
	end
	it "rejects improperly formatted email addresses" do
		emails = %w[@ user@ @example.com .com]
		emails.each do |email|
			user = User.new(email: email)
			user.valid?
			expect(user.errors[:email].any?).to eq(true)
		end
	end

end
