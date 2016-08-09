require 'rails_helper'
describe "Visiting another user project process" do
  let(:owner) { FactoryGirl.create :user_with_project }
  let(:project) { owner.projects.first }
  let(:user) { FactoryGirl.create :user }

  def go_to_project
    login_as(user)
    visit project_path(project) 
  end

  context "when encourages an incomplete project" do
    it "encourages 1 time" do
    end

    it "can't encourage 2 times" do
    end 
  end

  context "when asks to be a member of the project" do
    it "can ask 1 time" do
    end

    it "can't ask 2 times" do
    end
  end
end
