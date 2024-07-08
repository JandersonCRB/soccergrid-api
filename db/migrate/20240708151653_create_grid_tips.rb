class CreateGridTips < ActiveRecord::Migration[7.1]
  def change
    create_table :grid_tips do |t|
      t.references :grid, null: false, foreign_key: true
      t.integer :i
      t.integer :j
      t.string :description

      t.timestamps
    end
  end
end
