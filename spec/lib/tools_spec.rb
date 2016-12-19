require 'rails_helper'
require 'tools'

RSpec.describe "Tool - init_hash" do
  xscenario "returns empty hash with configured default value" do

    include Tools

    test_default = false
    test_hash = Tools.init_hash(test_default)

    expect(test_hash).to eq({})
    expect(test_hash[:whatever]).to eq(test_default)
  end
end