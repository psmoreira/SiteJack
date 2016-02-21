class CreateTrabalhos < ActiveRecord::Migration
  def change
    create_table :trabalhos do |t|
      t.float :noteumTotalHoras
      t.float :numHorasPagas
      t.float :precoHora1
      t.float :precoHora1
      t.float :precoDia
      t.float :precoTotal
      t.boolean :regularizado
      t.boolean :recibo
      t.datetime :dataPagamento
      t.timestamps null: false
    end
  end
end
