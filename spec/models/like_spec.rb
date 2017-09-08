require "rails_helper"

RSpec.describe Like, type: :model do
  describe "Like" do
    it {should belong_to(:comment)}
    it {should belong_to(:post)
    it {should belong_to(:user)}
  end
end
