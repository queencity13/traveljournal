class City < ActiveRecord::Base
  has_many :hotels
  has_many :restaurants
end
