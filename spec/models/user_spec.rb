require 'spec_helper'

describe User do
  describe 'Sign up', :type => :feature do
    let(:submit) { "Sign up" }

    let(:person) do
      @user = FactoryGirl.create(:user)
    end

    it 'with valid information' do
      visit new_user_registration_path
      user_count = User.count
      person
      expect(User.count).to eq(user_count + 1)
    end

    it 'without valid information' do
      visit new_user_registration_path
      expect{ click_button submit }.not_to change(User, :count)
    end
  end
end
