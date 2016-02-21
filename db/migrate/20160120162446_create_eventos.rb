class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.string :descricao
      t.string :tipoEvento
      t.string :localEvento
      t.string :eventoParent #Já não me lembro para que serve, mas seja...
      t.datetime :dataInicio
      t.datetime :dataInicioEvento
      t.datetime :dataFimEvento
      t.integer :numPessoas
      t.float :precoPorPessoa
      t.timestamps null: false
    end
  end
end
