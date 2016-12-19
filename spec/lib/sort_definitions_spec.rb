require 'rails_helper'
require 'sort_definitions'

RSpec.describe "Confirm definition details" do
  class TestSortDefinitions
    include SortDefinitions
  end
  scenario "List of valid sort criterias is accurate" do
    expect(TestSortDefinitions::VALID_SORTS.count).to eq(2)
    expect(TestSortDefinitions::VALID_SORTS.include?("location")).to be(true)
    expect(TestSortDefinitions::VALID_SORTS.include?("interest")).to be(true)
  end
  scenario "List of valid sort expressions is accurate" do
    expect(TestSortDefinitions::SORT_EXPRESSIONS.count).to eq(2)
    expect(TestSortDefinitions::SORT_EXPRESSIONS["location"]).to eq("city ASC")
    expect(TestSortDefinitions::SORT_EXPRESSIONS["interest"]).to eq("level_of_interest DESC")
  end
end