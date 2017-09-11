require "rails_helper"

RSpec.describe Tag, type: :model do
  describe "Tag" do
    it {should belong_to(:post_tags)}
    it {should belong_to(:posts).through(:post_tags)}
  end
end
