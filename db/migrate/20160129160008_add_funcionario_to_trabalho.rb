class AddFuncionarioToTrabalho < ActiveRecord::Migration
  def change
    add_reference :trabalhos, :funcionario, index: true, foreign_key: true
  end
end
