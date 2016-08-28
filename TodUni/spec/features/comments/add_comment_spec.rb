require 'rails_helper'
describe "The comments section" do
	let(:user) { FactoryGirl.create :user_complete }
	let(:project) {FactoryGirl.create :project }

	def go_to_project
		login_as(user)
		user.own_project project
		visit project_path(project)
	end

	def add_comment
		fill_in 'comment_body', with: 'Test comment'
		click_on 'Add comment'
	end

	context "logged in" do
		it "shows form to add comment" do
			go_to_project

			expect(page).to have_selector('form.new_comment', :count => 1)
		end

		it "displays comment after being added" do
			go_to_project
			add_comment

			expect(page).to have_text('Comments count: 1')
		end

		it "displays commenter's name" do
			go_to_project
			add_comment
			
			expect(page).to have_text(user.name)
		end

		it "displays commenter's picture" do
			go_to_project
			add_comment

			expect(page).to have_xpath('//img')
		end
	end

	context "not logged in" do
		it "doesn't show form to add comment" do
			go_to_project
			logout
			visit project_path(project)

			expect(page).to have_no_selector('form.new_comment')
		end
	end
end

