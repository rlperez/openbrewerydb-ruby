# frozen_string_literal: true
require_relative '../lib/open_brewery_db/brewery'
require 'json'
require 'spec_helper'

RSpec.describe Brewery do
  let(:brewery_list) {
    '[
    {
        "id": 2,
        "name": "Avondale Brewing Co",
        "brewery_type": "micro",
        "street": "201 41st St S",
        "city": "Birmingham",
        "state": "Alabama",
        "postal_code": "35222-1932",
        "country": "United States",
        "longitude": "-86.774322",
        "latitude": "33.524521",
        "phone": "2057775456",
        "website_url": "http://www.avondalebrewing.com",
        "updated_at": "2018-08-23T23:19:57.825Z",
        "tag_list": []
    },
    {
        "id": 44,
        "name": "Trim Tab Brewing",
        "brewery_type": "micro",
        "street": "2721 5th Ave S",
        "city": "Birmingham",
        "state": "Alabama",
        "postal_code": "35233-3401",
        "country": "United States",
        "longitude": "-86.7914000624146",
        "latitude": "33.5128492349817",
        "phone": "2057030536",
        "website_url": "http://www.trimtabbrewing.com",
        "updated_at": "2018-08-23T23:20:31.423Z",
        "tag_list": []
    }
]'
  }

  let(:single_brewery) {
    '{
  "id": 5494,
  "name": "MadTree Brewing",
  "brewery_type": "regional",
  "street": "3301 Madison Rd",
  "city": "Cincinnati",
  "state": "Ohio",
  "postal_code": "45209-1132",
  "country": "United States",
  "longitude": "-84.4239715",
  "latitude": "39.1563725",
  "phone": "5138368733",
  "website_url": "http://www.madtreebrewing.com",
  "updated_at": "2018-08-24T15:44:22.281Z",
  "tag_list": [
    "patio"
  ]
}'
  }

  it 'Marshalls single from JSON' do
    brewery = Brewery.new
    brewery.from_json(single_brewery)
    expect(brewery.id).to eq(5494)
    expect(brewery.name).to eq('MadTree Brewing')
    expect(brewery.brewery_type).to eq('regional')
    expect(brewery.street).to eq('3301 Madison Rd')
    expect(brewery.city).to eq('Cincinnati')
    expect(brewery.state).to eq('Ohio')
    expect(brewery.postal_code).to eq('45209-1132')
    expect(brewery.country).to eq('United States')
    expect(brewery.longitude).to eq('-84.4239715')
    expect(brewery.latitude).to eq('39.1563725')
    expect(brewery.phone).to eq('5138368733')
    expect(brewery.website_url).to eq('http://www.madtreebrewing.com')
    expect(brewery.updated_at).to eq('2018-08-24T15:44:22.281Z')
    expect(brewery.tag_list).to eq(["patio"])
  end

  it 'Marshalls list from JSON' do
    breweries = Brewery.many(brewery_list)
    expect(breweries.length).to eq(2)
  end
end
