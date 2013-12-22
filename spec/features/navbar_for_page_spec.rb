require 'spec_helper'

describe "User" do
  before :each do
    visit '/'
  end
  it "visit the site" do
    expect(page).to have_content 'Posts Index'
  end

  it 'visit the sign up' do
    click_link 'Sign up'
    visit '/users/sign_up'
    expect(page).to have_content 'Sign up'
  end

  it 'visit the sign in' do
    click_link 'Sign in'
    visit '/users/sign_in'
    expect(page).to have_content 'Sign in'
  end

  it 'sign out' do
    click_link 'Sign up'
      fill_in 'Email', with: 'johnwat@yahoo.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content 'Sign out'
  end

end
