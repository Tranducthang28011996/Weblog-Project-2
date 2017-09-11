require "rails_helper"

RSpec.describe Relationship, type: :model do
  describe "Relationship" do
    it {should belong_to(:follower)}
    it {should have_many(:followed)}
  end
end
