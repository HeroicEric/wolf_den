require 'spec_helper'

describe User do
  describe 'Sign up', :type => :feature do
    let(:submit) { "Sign up" }
    let(:user_count) { User.count }

    let(:person) do
      @user = FactoryGirl.create(:user)
    end

    it 'with valid information' do
      visit new_user_registration_path
      user_count
      person
      expect(User.count).to eq(user_count + 1)
    end

    it 'without valid information' do
      visit new_user_registration_path
      user_count
      click_button submit
      expect(User.count).to eq(user_count)
    end
  end
end
