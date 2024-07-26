class CreateClubFoundations < ActiveRecord::Migration[7.1]
  def change
    create_table :club_foundations do |t|
      t.string :club_key
      t.date :foundation_date

      t.timestamps
    end
  end
end
