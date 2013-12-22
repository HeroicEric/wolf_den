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

 # it 'sign out' do
 #   user = FactoryGirl.create(:user)
 #   click_link 'Sign in' do
 #     fill_in 'Email', with: user[:email]
 #     fill_in 'Password', with: 'password'
 #   end
 #   click_button 'Sign in'
 #   expect(page).to have_content 'Sign out'
 # end

end
