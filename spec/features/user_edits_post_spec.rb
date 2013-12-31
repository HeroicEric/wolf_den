require 'spec_helper'

feature "User edits post" do
  scenario "User edits post" do
    user = FactoryGirl.create(:user)
    post1 = FactoryGirl.create(:post, user: user)

    sign_in_as(user)

    visit user_path(user)
    click_on "Edit"
    fill_in "Title", with: "John the Wolf"
    fill_in "Content", with: "Drinks tea while surfing MySpace.com!"
    click_on "Save"
    expect(page).to have_content "Post updated successfully."
  end

  scenario "user does not see edit link if they are not the post owner" do
    user = FactoryGirl.create(:user)
    post1 = FactoryGirl.create(:post, user: user)
    visit user_path(user)
    expect(page).to_not have_content("Edit")
  end
end
