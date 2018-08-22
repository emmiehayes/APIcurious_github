require 'rails_helper'

#stub_omniauth method on line 6 located in rails_helper
feature "user visiting the root can log in" do
  scenario "using github oauth" do
    stub_omniauth
    visit root_path

    expect(page).to have_button('Sign In with GitHub')

    click_button 'Sign In with GitHub'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Emmie Hayes")
    expect(page).to have_button("Log Out")
  end
end