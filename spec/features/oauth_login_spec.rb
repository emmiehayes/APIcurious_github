require 'rails_helper'

feature "user visiting the root can log in" do
  scenario "using github oauth" do
    stub_omniauth
    visit root_path

    click_button 'Sign In with GitHub'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Emmie Hayes")
    expect(page).to have_button("Log Out")
  end
end