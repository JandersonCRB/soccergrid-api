class CreateGridAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :grid_answers do |t|
      t.references :grid, null: false, foreign_key: true
      t.integer :i
      t.integer :j
      t.string :club_key

      t.timestamps
    end
  end
end
