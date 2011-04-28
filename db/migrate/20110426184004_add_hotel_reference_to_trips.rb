class AddHotelReferenceToTrips < ActiveRecord::Migration
  def self.up
    add_column :trips, :hotel_id, :integer
  end

  def self.down
    remove_column :trips, :hotel_id
  end
end
