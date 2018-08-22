require 'rails_helper'

feature 'a user visiting the their dashboard' do 
  scenario 'can see a list of their repositories' do 
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit '/dashboard'

    expect(page).to have_content('My Repositories')
  end
end