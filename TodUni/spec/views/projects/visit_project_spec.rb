require 'rails_helper'
describe "Visiting another user's project process" do
  let(:owner) { FactoryGirl.create :user_with_project }
  let(:project) { owner.projects.first }
  let(:user) { FactoryGirl.create :user }

  def go_to_project
    login_as(user)
    visit project_path(project) 
  end

  context "when visits an empty incomplete project" do
    it "shows the project's name" do
    end

    it "shows the project's description" do
    end

    it "shows a default image" do
    end

    it "shows a encourage button" do
    end  
  end

  context "when visits an approved project without progress" do
    it "shows the project's name" do
    end

    it "shows the project's description" do
    end

    it "shows the project's image" do
    end

    it "shows the project's members" do
    end

    it "shows the project's owner" do
    end

    it "shows the project's tags" do
    end

    it "shows the project's analisis" do
    end

    it "shows the project's design" do
    end 

    it "shows the project's start date" do
    end

    it "shows the project's end date" do
    end
  end
end
