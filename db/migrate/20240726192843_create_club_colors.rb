class CreateClubColors < ActiveRecord::Migration[7.1]
  def change
    create_table :club_colors do |t|
      t.string :club_key
      t.string :color

      t.timestamps
    end
  end
end
