require "rails_helper"

RSpec.describe User, type: :model do
  describe "User" do
    it {should have_many(:comments)}
    it {should have_many(:likes)}
    it {should have_many(:tags)}
    it {should have_many(:posts)}
  end
end
