class AddGeolocationToBars < ActiveRecord::Migration[5.0]
  def change
    add_column :bars, :geolocation, :string
  end
end
