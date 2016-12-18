require 'rails_helper'

RSpec.describe Category, "associations", type: :model do
  it { should have_many(:jobs) }
end

RSpec.describe Category, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:uniqueness) }
  end
end
