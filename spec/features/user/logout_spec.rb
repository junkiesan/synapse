require "rails_helper"

RSpec.feature "Logout", :type => :feature do
  let(:user) { create(:user) }

  scenario 'user successfully logs out', js: false do
    sign_in user
    visit root_path
    find('nav #user-settings').click
    first('nav a', text: 'Log out').click
    expect(page).to have_selector('nav a', text: 'Login')
  end

end