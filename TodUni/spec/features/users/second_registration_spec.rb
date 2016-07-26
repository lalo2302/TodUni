require 'rails_helper'
describe "User's second registration process" do
	let(:user) {FactoryGirl.create :user }

	context "logging in with incomplete information" do
		it "shows form to complete profile" do
			login_as(user)
			visit dashboard_path(user)

			expect(page).to have_button(I18n.t("update"))
		end
	end

	context "filling the form" do
		it "updates the user" do
			login_as(user)
			visit dashboard_path(user)
			fill_in "user_name", :with => 'Test name'
			select('20', :from => 'user[date_birth(3i)]')
			select('febrero', :from => 'user[date_birth(2i)]')
			select('1994', :from => 'user[date_birth(1i)]')
      attach_file "user_avatar", Rails.root.join('spec/support/valid_image.jpg')
			click_button(I18n.t("update"))

			expect(page).to have_link(I18n.t("dashboards.show.create_project"), href: new_project_path)
		end
	end
end

