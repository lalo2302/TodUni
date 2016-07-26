require 'rails_helper'
describe "The sign in process" do

	it "signs in" do
		user = FactoryGirl.create(:user_complete)

		#TODO: Fill_in with FactoryGirl
		visit new_user_session_path
		fill_in :email, :with => user.email
		fill_in :password, :with => user.password
		
		click_button 'Entra'	

		expect(page).to have_current_path(dashboard_path(user))
	end

	it "Doesn't sign in" do
		visit new_user_session_path

		fill_in :email, :with => 'example@example.com'
		fill_in :password, :with => '12345678'
		
		click_button 'Entra'	

		expect(page).to have_current_path(new_user_session_path)
	end
end
