class AddFuncionarioToPagamento < ActiveRecord::Migration
  def change
    add_reference :pagamentos, :funcionario, index: true, foreign_key: true
  end
end
