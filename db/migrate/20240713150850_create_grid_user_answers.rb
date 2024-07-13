class CreateGridUserAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :grid_user_answers do |t|
      t.references :grid, null: false, foreign_key: true
      t.integer :i
      t.integer :j
      t.string :answer
      t.string :remote_ip

      t.timestamps
    end
  end
end
