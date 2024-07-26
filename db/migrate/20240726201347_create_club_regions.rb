class CreateClubRegions < ActiveRecord::Migration[7.1]
  def change
    create_table :club_regions do |t|
      t.string :club_key
      t.string :state
      t.string :region

      t.timestamps
    end
  end
end
