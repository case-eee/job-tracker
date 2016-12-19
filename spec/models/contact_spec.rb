require 'rails_helper'

RSpec.describe Contact, "associations", type: :model do
  it { should belong_to(:company) }
end

RSpec.describe Contact, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:position) }
    it { is_expected.to validate_presence_of(:email) }
  end

  it "is valid with name, position, and email" do
    company = Company.create(name: "ESPN")
    contact = company.contacts.create(first_name: "Jane",
                                        last_name: "Doe",
                                        position: "CEO",
                                        email: "jane@espn.com")

    expect(contact).to be_valid
  end
end
