require 'spec_helper'
require 'database_cleaner'

describe User do

  before do
    @user = User.new(name: "John", email: "user@example.com",
                     password: 'foobar1', password_confirmation: 'foobar1')
  end

  it { should validate_presence_of :name }
  it { should validate_presence_of :email }

  it { should respond_to :password }
  it { should respond_to :password_confirmation }

  describe "when password is not present" do
    before do
      @user = User.new(name: "john", email: "jmoon@gmail.com",
                       password: '', password_confirmation: '')
    end
    it { should_not be_valid }
  end

  john1 = FactoryGirl.create(:user)
  john2 = FactoryGirl.create(:user)
  john3 = FactoryGirl.create(:user)

  it "responds to name" do
    expect(john1).to respond_to(:name)
    expect(john2).to respond_to(:name)
    expect(john3).to respond_to(:name)
  end

  describe 'when name is not present' do
    before { @user.name = '' }
    it { should_not be_valid }
  end

  describe 'when email address is already taken' do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end
    it { should_not be_valid }
  end

  describe 'when password does not match' do
    before { @user.password_confirmation = "pooop" }
    it { should_not be_valid }
  end

  describe "signup page" do
    before { visit signup_path }

   let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a users" do
        expect { click_button ubmit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name", with: "Example User"
        fill_in "Email", with: "user@example.com"
        fill_in "Password", with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      end
  end
end
