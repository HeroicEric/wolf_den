require 'spec_helper'

describe Post do
  it { should have_many(:comments).dependent(:destroy) }

  # valid_attribute
  it { should have_valid(:title).when("John", "M00n") }
  it { should_not have_valid(:title).when(nil, "") }

  it { should have_valid(:content).when("asdasdasdasd", "Awesome stuff here") }
  it { should_not have_valid(:content).when(nil, "") }


  # shoulda matcher
  it { should validate_presence_of :title }
  it { should validate_presence_of :user_id }

  describe "john should approve of our post titles" do
    it "allows approved titles" do
      post = Post.new
      post.title = "1234"
      post.valid?
      expect(post.errors[:title]).to_not include "is not approved by John"
    end

    it "rejects unapproved titles" do
      post = Post.new
      post.title = "123"
      post.valid?
      expect(post.errors[:title]).to include "is not approved by John"
    end
  end
end
