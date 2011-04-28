require 'spec_helper'

describe "restaurants" do
  before do
    @restaurant1 = Restaurant.create(:name => "McDonald's")
    @restaurant2 = Restaurant.create(:name => "Red Robin")
  end

  describe "listing restaurants" do
    before do
      visit "/restaurants"
    end

    it "should list as many restaurants as we have" do
      page.all('ul li').should have(2).restaurants
    end

    it "should list all restaurant names" do
      restaurant_names = page.all('ul li').map(&:text)
      restaurant_names.should include(@restaurant1.name)
      restaurant_names.should include(@restaurant2.name)
    end

    describe "when the requested format is json" do
      before do
        visit "/restaurants.json"
      end

      it "should render the found restaurants as json" do
        expected = json_escape([@restaurant1.to_json,@restaurant2.to_json].to_json)
        actual   = json_escape(page.body.to_json)
        expected.should == actual
      end
    end
  end

  describe "when dealing with new restaurants" do
    before do
      @chicago = City.create(:name => 'Chicago')
      visit "/restaurants/new"
    end

    it "should display the form page" do
      page.body.should_not be_empty
    end
 
    describe "when creating a new restaurant" do
      before do
        fill_in 'Name', :with => 'Subway'
        fill_in 'Description', :with => 'Eat fresh'
        select 'Chicago', :from => 'City'
        click_button 'Save'
      end

      it "should show the new restaurant" do
        page.should have_xpath("//h1[.='Subway']")
      end
    end
  end
end
