require 'rails_helper'

RSpec.describe Contact, type: :model do
  it { should belong_to(:company) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:position) }
  it { should validate_presence_of(:email) }
end
