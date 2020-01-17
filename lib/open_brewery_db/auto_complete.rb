require 'active_model'

class AutoComplete
  include ActiveModel::Serializers::JSON
  
  attr_accessor :id, :name

  def attributes=(hash)
    hash.each { |key, value| send("#{key}=", value) }
  end

  def attributes
    instance_values
  end
end