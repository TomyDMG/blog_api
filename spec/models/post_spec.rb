require 'rails_helper'

RSpec.describe Post, type: :model do
  before { @user = User.new(nickname: "Example User", email: "user@example.com", password: "Example")
    @post = Post.new(title: "Example post", body: "test test test test test test test test test test test", author: "example", user_id: 1) }

  subject { @post }

  it { should respond_to(:title) }
  it { should respond_to(:body) }

  #it { should be_valid }

  describe "when title is not present" do
    before { @post.title = " "}
    it { should_not be_valid }
  end

  describe "when body is not present" do
    before { @post.body = "  "}
    it { should_not be_valid }
  end
end
