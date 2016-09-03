require 'rails_helper'
describe "The create-a-project process" do
	let(:user) { FactoryGirl.create :user_complete }

	def fill_field(field, content)
		login_as(user)
		visit new_project_path
		fill_in field, :with => content
		click_button "Crear proyecto"
	end

	context "when creates a valid project" do
		it "redirects to project path" do
			login_as(user)
			visit new_project_path

			fill_in :name, :with => 'Nombre de proyecto' 
		 	fill_in :description, :with => 'Descripción del proyecto'
			click_button "Crear proyecto"

			expect(page).to have_current_path(project_dashboard_path(user.projects.last))
		end
	end
	
	context "when creates a project without name" do

		it "stays in projects path" do
			fill_field(:description, 'Descripcion del proyecto')
			click_button "Crear proyecto"

			expect(page).to have_current_path(projects_path)
		end

		it "shows a flash message" do
			fill_field(:description, 'Descripcion del proyecto')
			click_button "Crear proyecto"

			expect(page).to have_content('Tu proyecto necesita nombre')
		end
	end

	context "when creates a project without description" do

		it "stays in projects path" do
			fill_field(:name, 'Nombre del proyecto')
			click_button "Crear proyecto"

			expect(page).to have_current_path(projects_path)
		end

		it "shows a flash message" do
			fill_field(:name, 'Nombre del proyecto')
			click_button "Crear proyecto"
			
			expect(page).to have_content('Tu proyecto necesita descripción')

		end
	end
end
