class CreateBrazilianCupChampions < ActiveRecord::Migration[7.1]
  def change
    create_table :brazilian_cup_champions do |t|
      t.string :champion_key
      t.string :vice_key
      t.integer :year

      t.timestamps
    end
  end
end
