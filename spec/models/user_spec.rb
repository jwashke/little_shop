require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  describe "associations" do
    it { is_expected.to have_many(:orders) }
    it { is_expected.to have_many(:order_items) }
    it { is_expected.to have_many(:items) }
  end

  describe "admin" do
    it "should return true when asked if admin" do
      admin = create(:admin)
      expect(admin.admin?).to be(true)
    end

    it "should return false when asked if default user" do
      admin = create(:admin)
      expect(admin.default?).to be(false)
    end
  end

  describe "non admin user" do
    it "should return true when asked if default user" do
      user = create(:user)
      expect(user.default?).to be(true)
    end

    it "should return false when asked if admin" do
      user = create(:user)
      expect(user.admin?).to be(false)
    end
  end
end
