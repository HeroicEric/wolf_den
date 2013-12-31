require 'spec_helper'

feature 'Sign out' do
  given!(:user) { FactoryGirl.create(:user) }

  scenario 'signs people out' do
    sign_in_as(user)
      click_on 'Sign out'
    expect(page).to have_content 'Signed out successfully.'
  end

end
