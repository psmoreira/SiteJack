class AddTrabalhoToPagamento < ActiveRecord::Migration
  def change
    add_reference :pagamentos, :trabalho, index: true, foreign_key: true
  end
end
