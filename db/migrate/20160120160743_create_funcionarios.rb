class CreateFuncionarios < ActiveRecord::Migration
  def change
    create_table :funcionarios do |t|
      t.string :nome, limit: 200
      t.string :morada
      t.string :contacto
      t.string :email
      t.string :contribuinte
      t.string :observacoes
      t.string :fotografia
      t.integer :prioridade
      t.boolean :activo
      t.boolean :recibo
      t.float   :precoHora1
      t.float   :precoHora2
      t.float   :precoDia
      t.string :localTrabalho
      t.float  :totalRecebido
      t.datetime :dataUltimoTrabalho
      t.timestamps null: false
    end
  end
end
