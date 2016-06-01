require 'rails_helper'
describe "The sigin process" do
	#before :each do
	#	user = FactoryGirl.create(:user)
	#	user.save
	#end

	it "signs in" do
		user = FactoryGirl.create(:user)

		visit new_user_session_path
		fill_in :email, :with => 'example@example.com'
		fill_in :password, :with => '12345678'
		
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
