require 'rails_helper'
describe "Members features" do
  let(:user) { FactoryGirl.create :user_with_project }

  def go_to_project
    login_as(user)
    visit project_dashboard_path(user.projects.first)
  end

  context "when visits the project 1st time" do
    it "only has 1 owner" do
      go_to_project

      expect(page).to have_xpath('//li[@id="owner"]', :count => 1)
    end

    it "the owner is the user" do
      go_to_project

      expect(find('li#owner')).to have_content(user.name)
    end

    it "doesn't have members" do
      go_to_project

      expect(page).not_to have_css('.member')
    end
  end

  context "adding members" do
    it "adds an existing user" do
      go_to_project

      user2 = FactoryGirl.create(:user)
      fill_in 'project[email]', :with => user2.email
      click_button "Agregar"

      expect(page).to have_css('.member', :count => 1)
    end

    it "tries to add an inexistent user" do
      go_to_project

      user2 = FactoryGirl.build(:user)
      fill_in 'project[email]', :with => user2.email
      click_button "Agregar"

      expect(page).not_to have_css('.member')
    end
  end
end
