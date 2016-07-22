require 'rails/helper'
describe "The second registration process" do
  let(:user) { FactoryGirl.create :user_complete }
  let(:project) { FactoryGirl.create :project }
  
  def go_to_project
    login_as(user)
    visit project_path(project)
  end

  context "uploading a picture" do
    it "upload a valid image" do
      go_to_project
      attach_file Rails.root.join('spec/support/valid_image.jpg')
      click_button "Agregar imagen"

      expect(page).to have_selector(:img)
    end 

    it "not upload an invalid image" do
      go_to_project
      attach_file Rails.root.join('spec/support/invalid_image.gif')
      click_button "Agregar imagen"

      expect(page).not_to have_selector(:img)
    end

    it "shows flash message for invalid image" do
      go_to_project
      attach_file Rails.root.join('spec/support/invalid_image.jpg')
      click_button "Agregar imagen"

      expect(page).to have_content('Lo siento, intenta con otra imagen')
    end

    it "uploading nothing" do
      go_to_project
      
      click_button "Agregar imagen"

      expect(page).to have_content('No seleccionaste ninguna imagen')
    end
  end

  context "Adding a hashtag" do
    it "adds 1 hashtag" do
    end

    it "adds 5 hashtags" do
    end

    it "adds no hashtag" do
    end

    it "adds existing hashtag" do
    end

    it "adds new hashtag" do
    end
  end
end
