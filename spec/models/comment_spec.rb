require 'rails_helper'

RSpec.describe Comment, type: :model do
  before { @user = User.new(nickname: "Example User", email: "user@example.com", password: "Example")
    @post = Post.new(title: "Example post", body: "test test test test test test test test test test test", author: "example", user_id: 1)
    @comment = Comment.new(body: "test test test test test test test test test test test", author: "example", user_id: 1, post_id: 1) }

  subject { @comment }

  it { should respond_to(:body) }

  #it { should be_valid }

  describe "when body is not present" do
    before { @comment.body = " "}
    it { should_not be_valid }
  end
end
