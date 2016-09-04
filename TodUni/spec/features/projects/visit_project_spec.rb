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
    end

    it "sees the project name" do
    end

    it "sees the members' list" do
    end

    it "sees the project description" do
    end
  end

  context "when encourages an incomplete project" do
    it "encourages 1 time" do
    end

    it "can't encourage 2 times" do
    end 

    it "the phases are not shown" do
    end
  end

  context "when asks to be a project's member" do
    it "can ask 1 time" do
    end

    it "can't ask 2 times" do
    end
  end
end
