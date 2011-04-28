class AddCityReferenceToRestaurants < ActiveRecord::Migration
  def self.up
    add_column :restaurants, :city_id, :integer
  end

  def self.down
    remove_column :restaurants, :city_id
  end
end
