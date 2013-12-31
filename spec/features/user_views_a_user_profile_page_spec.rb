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
    post1 = FactoryGirl.create(:post, user: user)
    post2 = FactoryGirl.create(:post, user: user)

    visit user_path(user)

    expect(page).to have_content(post1.title)
    expect(page).to have_content(post2.title)
  end

  scenario "User doesn't see posts written by another user" do 
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post)

    visit user_path(user)

    expect(page).to_not have_content(post.title)
  end

  scenario "user sees message that the user hasn't written any posts" do
    user = FactoryGirl.create(:user)
    visit user_path(user)
    expect(page).to have_content "Lurker lurks but has not written any posts."
  end
end
