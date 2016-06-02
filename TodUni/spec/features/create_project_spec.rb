require 'rails_helper'
describe "The create a project process" do
	before :each do
		user = FactoryGirl.create(:user)
		login_as(user)

		project = FactoryGirl.create(:project)
	end

	context "When creates creates a valid project" do

		it "Redirects to project path" do
			visit new_project_path

			fill_in :name, :with => 'Nombre de proyecto'
	  	fill_in :description, :with => 'Descripcion del proyecto'
			
			click_button "Registrar"

			expect(page).to have_current_path(project_path(Project.last))
		end
	end

	context "When creates a project without name" do

		visit new_project_path
		fill_in :description, :with => 'Descripcion de proyecto'
		click_button "Registrar"

		it "Stays in new project path" do
			expect(page).to have_current_path(new_project_path)
		end
		it "shows a flash message" do
			expect(page).to have_content('Dale un nombre a tu proyecto')
		end
	end

	context "When creates a project without description" do

		visit new_project_path
		fill_in :name, :with => 'Nombre del projecto'
		click_button "Registrar"

		it "Stays in new project path" do
			expect(page).to have_current_path(new_project_path)
		end
		it "shows a flash message" do
			expect(page).to have_content('Dale una descripcion a tu proyecto')
		end

	end
end
