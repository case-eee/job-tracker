require 'rails_helper'
require 'sort_definitions'

RSpec.describe "Confirm definition details" do
  scenario "Detais are accurate" do
    class TestSortDefinitions
      include SortDefinitions
    end

    expect(TestSortDefinitions::VALID_SORT.count).to eq(2)
    expect(TestSortDefinitions::VALID_SORT.include?("location")).to be(true)
    expect(TestSortDefinitions::VALID_SORT.include?("interest")).to be(true)
  end
end