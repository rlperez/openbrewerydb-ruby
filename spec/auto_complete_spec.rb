# frozen_string_literal: true
require_relative '../lib/open_brewery_db/auto_complete'
require 'json'
require 'spec_helper'

RSpec.describe AutoComplete do
  let(:single_auto_complete) {
    '{"id":"530","name":"Diving Dog Brewhouse"}'
  }

  let(:auto_complete_list) {
    '[{"id":"530","name":"Diving Dog Brewhouse"}, {"id":"5","name":"Flying Dog Brewhouse"}]'
  }

  it 'Marshalls from JSON' do
    auto_complete = AutoComplete.new
    auto_complete.from_json(single_auto_complete)
    expect(auto_complete.id).to eq("530")
    expect(auto_complete.name).to eq("Diving Dog Brewhouse")
  end

  it 'Marshalls list from JSON' do
    auto_completes = JSON.parse(auto_complete_list).map { |a|
      auto_complete = AutoComplete.new
      auto_complete.from_json(a.to_json)
    }
    expect(auto_completes.length).to eq(2)
  end
end
