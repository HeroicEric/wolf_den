require 'spec_helper'

feature "user views a user profile page" do

  # As a user
  # I want to view a user profile page
  # So that I can see all of the user's information

  # Acceptance Criteria
  # - I should see the user's email
  # - I should see a list of the posts that the user has written
  # - I should not see posts from other users

  scenario "User views their own profile page" do 
    user = FactoryGirl.create(:user)
    visit user_path(user)
    expect(page).to have_content(user.email)
  end

  scenario "User sees posts written by user" do 
    user = FactoryGirl.create(:user)
    post1 = FactoryGirl.create(:post)
    post2 = FactoryGirl.create(:post)
    post3 = FactoryGirl.create(:post)

    visit user_path(user)
    expect(page).to have_content(user.email)
  end
end
