class CreateBrazilianSerieAChampions < ActiveRecord::Migration[7.1]
  def change
    create_table :brazilian_serie_a_champions do |t|
      t.integer :year
      t.string :champion_key
      t.string :vice_key

      t.timestamps
    end
  end
end
