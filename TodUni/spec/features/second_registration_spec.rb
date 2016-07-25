require 'rails_helper'
describe "The second registration process" do
  let(:user) { FactoryGirl.create :user_complete }
  let(:project) { FactoryGirl.create :project }
  
  def go_to_project
    login_as(user)
    user.own_project project
    visit project_path(project)
  end

  context "uploading a picture" do
    it "upload a valid image" do
      go_to_project
      attach_file "project_picture", Rails.root.join('spec/support/valid_image.jpg')
      click_button "Agregar imagen"

      expect(page).to have_xpath('//img')
    end 

    it "not upload an invalid image" do
      go_to_project
      attach_file "project_picture", Rails.root.join('spec/support/invalid_image.jpg')
      click_button "Agregar imagen"

      expect(page).not_to have_xpath('//img')
    end

    it "shows flash message for invalid image of > 6mb" do
      go_to_project
      attach_file "project_picture", Rails.root.join('spec/support/invalid_image.jpg')
      click_button "Agregar imagen"

      expect(page).to have_content('Lo siento, vuélvelo a intentar o sube otra imagen')
    end

    it "uploading nothing" do
      go_to_project
      
      click_button "Agregar imagen"

      expect(page).to have_content('Lo siento, vuélvelo a intentar o sube otra imagen')
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
