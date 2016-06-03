require 'rails_helper'
describe "The create-a-project process" do
	let(:user) { FactoryGirl.create :user }
	let(:project) { FactoryGirl.create :project }

	def fill_field(field, content)
		visit new_project_path
		fill_in field, :with => content
		click_button "Registrar"
	end

	context "when creates a valid project" do
		it "redirects to project path" do
			login_as(user)
			visit new_project_path

			fill_in :name, :with => 'Nombre de proyecto'
	  	fill_in :description, :with => 'Descripcion del proyecto'
			click_button "Registrar"

			expect(page).to have_current_path(project_path(Project.last))
		end
	end
	
	context "when creates a project without name" do
		it "stays in new project path" do
			fill_field(:description, 'Descripcion del proyecto')

			expect(page).to have_current_path(new_project_path)
		end
		it "shows a flash message" do
			fill_field(:description, 'Descripcion del proyecto')

			expect(page).to have_content('Dale un nombre a tu proyecto')
		end
	end

	context "when creates a project without description" do
		it "stays in new project path" do
			fill_field(:name, 'Nombre del proyecto')

			expect(page).to have_current_path(new_project_path)
		end
		it "shows a flash message" do
			fill_field(:name, 'Nombre del proyecto')
			
			expect(page).to have_content('Dale una descripcion a tu proyecto')
		end
	end
end
