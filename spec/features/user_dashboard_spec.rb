require 'rails_helper'

feature 'a user visiting the their dashboard' do 
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit '/dashboard'
  end

  scenario 'sees basic profile information' do 
    expect(page).to have_css('.image')
    expect(page).to have_content(@user.name)
    expect(page).to have_content('Followers')
    expect(page).to have_content('Following')
  end

  scenario 'sees a list of their repositories' do 
    expect(page).to have_css('.table')
    expect(page).to have_content('Name')
    expect(page).to have_content('Description')
    expect(page).to have_content('Description')
    expect(page).to have_content('Link')
    expect(page).to have_content('Stars')
    expect(page).to have_content('Created')
    expect(page).to have_content('Updated')
  end

  scenario 'sees recent commits in activity feed' do 
    expect(page).to have_content('Type')
    expect(page).to have_content('Repo')
    expect(page).to have_content('Message')
    expect(page).to have_content('Date')
  end
end