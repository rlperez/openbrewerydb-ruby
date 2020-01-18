require 'active_model'

class Brewery
  include ActiveModel::Serializers::JSON

  attr_accessor :id, :name, :brewery_type, :street, :city, :state, :postal_code, :country, :longitude, :latitude, :phone, :website_url, :updated_at, :tag_list

  def attributes=(hash)
    hash.each { |key, value| send("#{key}=", value) }
  end

  def attributes
    instance_values
  end

  def self.many(brewery_list)
    JSON.parse(brewery_list).
        map(&:to_json).
        map(&Brewery.new.method(:from_json))
  end
end