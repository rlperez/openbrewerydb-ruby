# frozen_string_literal: true

require 'open_brewery_db/version'
require 'cgi'

module OpenBreweryDb
  class Error < StandardError;
  end

  BASE_URL = 'https://api.openbrewerydb.org/breweries'.freeze
  private_constant :BASE_URL

  def self.search(query)

  end

  def self.find(opts = {})
    results = find_as_json(opts)

  end

  def self.find_as_json(opts = {})
    url = "#{BASE_URL}?"
    opts = {page: 1, per_page: 20, sort_order: '-', sort_by: 'name'}.merge(opts)
    url += opts.map { |k, v| "#{k.to_s}=#{CGI.escape(v.to_s)}" }.join('&')
    HTTParty.get(url)
  end

  def self.get_brewery(id)

  end

  def self.autocomplete(query)

  end
end
