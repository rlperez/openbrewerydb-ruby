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
end