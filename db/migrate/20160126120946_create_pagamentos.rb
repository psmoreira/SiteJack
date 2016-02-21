class CreatePagamentos < ActiveRecord::Migration
  def change
    create_table :pagamentos do |t|
      t.float :precoHora1
      t.float :numTotalHoras
      t.float :numHorasPagas
      t.boolean :regularizado
      t.datetime :dataPagamento
      t.float :precoTotal
      t.datetime :dataCriacao
      t.timestamps null: false
    end
  end
end
