require 'rails_helper'
describe "Visiting another user project process" do
  let(:owner) { FactoryGirl.create :user_with_project }
  let(:project) { owner.projects.first }
  let(:user) { FactoryGirl.create :user }

  def go_to_project
    login_as(user)
    visit project_path(project) 
  end

  context "the visitor" do
    it "sees the owner name" do
      go_to_project

      expect(page).to have_content(owner.name)
    end

    it "identifies the owner" do
      go_to_project

      expect(page).to have_xpath('//li[@id="owner"]')
    end

    it "sees the project name" do
      go_to_project

      expect(page).to have_content(project.name)
    end

    it "sees the project description" do
      go_to_project

      expect(page).to have_content(project.description)
    end

    it "sees the members' list" do
      go_to_project

      expect(page).to have_xpath('//ul[@id="members"]')
    end

    it "sees the project description" do
      go_to_project

      expect(page).to have_content(project.description)
    end
  end

  context "when encourages an incomplete project" do
    it "encourages 1 time" do
      #go_to_project

      #click_button("¡Vamos!")

      #expect(page).to have_content("Tú crees en este proyecto")
    end

    it "can't encourage 2 times" do
      #go_to_project

      #click_button("¡Vamos!")

      #expect(page).not_to have_button("¡Vamos!")
    end 
  end

  context "when asks to be a project's member" do
    it "can ask 1 time" do
    end

    it "can't ask 2 times" do
    end
  end
end
