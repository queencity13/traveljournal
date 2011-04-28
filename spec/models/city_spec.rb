require 'spec_helper'

describe City do
  it "should have multiple restaurants" do
    @city = City.new
    @city.should respond_to(:restaurants)
  end 
end
