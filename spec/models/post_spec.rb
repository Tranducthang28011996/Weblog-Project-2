require "rails_helper"

RSpec.describe Post, type: :model do
  describe "post" do
    it {should belong_to(:user)}
    it {should have_many(:comments)}
    it {should have_many(:likes)}
    it {should have_many(:post_tags)}
    it {should have_many(:comments).through(:post_tags)}
  end
end
