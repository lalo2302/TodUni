require 'rails_helper'
include CommentsHelper
describe "The comments helper" do
	let(:user) {FactoryGirl.create :user_complete }
	let(:project) {FactoryGirl.create :project }

	def create_comment(parent)
		user.comments.create(body: "Test", parent: parent)
	end

	context "get_comments_count" do
		it "returns full nested count of parent object" do
			parent1 = create_comment(project)
			parent2 = create_comment(project)
			create_comment(parent1)
			create_comment(parent1)
			create_comment(parent2)

			expect(get_comments_count(project)).to eq(5)
		end
	end
end
