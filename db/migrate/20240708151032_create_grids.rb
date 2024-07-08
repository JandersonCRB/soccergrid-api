class CreateGrids < ActiveRecord::Migration[7.1]
  def change
    create_table :grids do |t|
      t.date :active_on
      t.integer :grid_number, null: false
      t.integer :grid_rows, null: false
      t.integer :grid_columns, null: false

      t.timestamps
    end

    add_index :grids, :active_on, unique: true, where: "active_on IS NOT NULL"
  end
end
