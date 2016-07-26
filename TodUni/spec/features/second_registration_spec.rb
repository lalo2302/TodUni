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

  context "Adding a tag" do
    it "adds 1 tag" do
      go_to_project

      within(:xpath, '//div[@id="tags"]') do
        fill_in :tag_list, :with => "tag_example"
        click_button "Agregar tags"
      end

      expect(page).to have_css('li.tag', :count => 1)
    end

    it "adds 5 tags" do
      go_to_project
      tags = "tag1, tag2, tag3, tag4, tag5"

      within(:xpath, '//div[@id="tags"]') do
        fill_in :tag_list, :with => tags
        click_button "Agregar tags"
      end

      expect(page).to have_css("li.tag", :count => 5)
    end

    it "adds no hashtag" do
      go_to_project

      within(:xpath, '//div[@id="tags"]') do
        click_button "Agregar tags"
      end

      expect(page).not_to have_css("li.tag") 
    end
  end
end
