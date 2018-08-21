require 'rails_helper'

feature 'a user visiting the user show page' do 
  scenario 'can see basic profile information' do 
    user = create(:user)
    allow_any_instance_of(ApplicationController).to recieve(:current_user).and_return(user)
    visit '/dashboard'

    
    expect(page).to have_content(user.username)
    expect(page).to have_css('.profile_pic')
    expect(page).to have_content('number of starred repos')
    expect(page).to have_content('number of followers')
    expect(page).to have_content('number following')
  end
end