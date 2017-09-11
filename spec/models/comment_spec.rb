require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "Comment" do
    it {should have_many(:likes)}
    it {should belong_to(:post)
    it {should belong_to(:user)}
  end
end
