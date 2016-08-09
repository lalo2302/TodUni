require 'rails_helper'
describe "Visiting another user project process" do
  let(:owner) { FactoryGirl.create :user_with_project }
  let(:project) { owner.projects.first }
  let(:user) { FactoryGirl.create :user }

  def go_to_project
    login_as(user)
    visit project_path(project) 
  end

  context "when visits an empty incomplete project" do
    it "shows the project name" do
    end

    it "shows the project description" do
    end

    it "shows a default image" do
    end

    it "shows a encourage button" do
    end  
  end

  context "when visits an approved project without progress" do
    it "shows the project name" do
    end

    it "shows the project description" do
    end

    it "shows the project image" do
    end

    it "shows the project members" do
    end

    it "shows the project owner" do
    end

    it "shows the project tags" do
    end

    it "shows the project analisis" do
    end

    it "shows the project design" do
    end 

    it "shows the project start date" do
    end

    it "shows the project end date" do
    end
  end
end
