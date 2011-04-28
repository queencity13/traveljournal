require 'spec_helper'

describe Restaurant do
  it "should be valid with valid attributes" do
    @restaurant = Restaurant.new(:name => "Bob's BBQ")
    @restaurant.should be_valid
  end

  it "should not be valid without a name" do
    @restaurant = Restaurant.new
    @restaurant.should_not be_valid
  end

  it "should not be valid with a name shorter than 2 characters" do
    @restaurant = Restaurant.new(:name => "A")
    @restaurant.should_not be_valid
  end

  it "should have a city" do
    @restaurant = Restaurant.new
    @restaurant.should respond_to(:city)
  end
end
