require 'spec_helper'

describe User do
  describe 'sign up' do
    it 'creates new user with valid input' do
      visit '/sessions/new'
      within('#session') do
        fill_in 'name', with: 'john'
        fill_in 'email', with: 'john@aol.com'
        fill_in 'password', with: 'foobar'
        fill_in 'password_confirmation', with: 'foobar'
      end

      click_link 'sign up'
      expect(page).to have_content 'success'
    end

    it 'does not creat new user with invalid input' do
      visit '/sessions/new'
        fill_in 'name', with: ''
        fill_in 'email', with: 'alskdjf'
        fill_in 'password', with: ''
        fill_in 'password_confirmation', with: ''
    end
  end
end
