class City < ActiveRecord::Base
  # validations
  validates_presence_of :name, :country
end
