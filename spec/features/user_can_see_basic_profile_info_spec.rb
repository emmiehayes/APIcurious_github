require 'rails_helper'

feature 'a user visiting the user show page' do 
  scenario 'can see basic profile information' do 
    user = create(:user)
    visit '/dashboard'


    

    expect(page).to have_css('.profile_pic')
    expect(page).to have_content('number of starred repos')
    expect(page).to have_content('number of followers')
    expect(page).to have_content('number following')
  end
end