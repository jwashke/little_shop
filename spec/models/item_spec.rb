require "rails_helper"

RSpec.describe Item, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_presence_of(:image_path) }
  it { is_expected.to validate_uniqueness_of(:title) }
end
