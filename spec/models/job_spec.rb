require 'rails_helper'

describe Job do
  describe "validations" do

    before {FactoryGirl.build(:job)}

    context "is valid with a title and level of interest" do
      it {should validate_presence_of(:title)}
      it {should validate_presence_of(:level_of_interest)}
      it {should validate_presence_of(:city)}
    end
  end


  describe "relationships" do
      before {FactoryGirl.build(:job)}

      context "belongs to a company" do
        it {should belong_to(:company)}
    end
  end
end
