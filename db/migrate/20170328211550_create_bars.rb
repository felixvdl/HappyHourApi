class CreateBars < ActiveRecord::Migration[5.0]
  def change
    create_table :bars do |t|
      t.string :name
      t.string :location
      t.string :monday
      t.string :tuesday
      t.string :wednesday
      t.string :thursday
      t.string :friday
      t.string :saturday
      t.string :sunday
      t.string :deal
      t.text :info
    end
  end
end
