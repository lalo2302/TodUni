require 'rails_helper'
describe "The user cannot access" do
  let(:user) {FactoryGirl.create :user}
  let(:user_complete) { FactoryGirl.create :user_with_project }
  let(:project) { user_complete.projects.first }

  context "translations page" do
    it "redirects to root" do
    end
  end

  context "other user's" do
    it "dashboard page" do
      login_as user

      visit dashboard_path(user_complete)

      expect(page).to have_content(user.email)
    end

    it "project dashboard" do
      login_as user

      visit project_dashboard_path(project)

      expect(page).to have_current_path(projects_path)
    end  

    it "edit page" do
      login_as user

      visit edit_user_registration_path

      expect(page).to have_content(user.name)
    end
  end
end
