require 'spec_helper'

feature "User adds a new post" do
  scenario "User fills out form with valid information" do 
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit new_post_path
    fill_in "Title", with: "John the Wolf"
    fill_in "Content", with: "Drinks tea while surfing MySpace.com!"
    click_on "Save"

    expect(page).to have_content "Post saved successfully."
  end

  scenario "unathenticated user tries to add a new post" do
    visit new_post_path
    expect(page).to have_content "You need to sign in or sign up before continuing."
  end
end
