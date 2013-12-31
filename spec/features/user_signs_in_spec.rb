require 'spec_helper'

feature 'Sign in' do
  given!(:user) { FactoryGirl.create(:user) }

  scenario 'signs people up with valid information' do
    visit new_user_session_path

    within('form#new_user') do
      fill_in 'Email', with: 'jmoon90@aol.com'
      fill_in 'Password', with: 'applepie'
      click_on 'Sign in'
    end

    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'signs people up with valid information' do
    visit new_user_session_path

    within('form#new_user') do
      click_on 'Sign in'
    end

    expect(page).to have_content 'Invalid email or password.'
  end
end
