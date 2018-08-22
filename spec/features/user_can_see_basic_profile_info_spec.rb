require 'rails_helper'

feature 'a user visiting the their dashboard' do 
  scenario 'can see basic profile information' do 
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit '/dashboard'

    expect(page).to have_content(user.username)
    expect(page).to have_css('.image')
    expect(page).to have_content('Followers')
    expect(page).to have_content('Following')
  end
end