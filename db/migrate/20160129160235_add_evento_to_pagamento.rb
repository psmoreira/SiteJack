class AddEventoToPagamento < ActiveRecord::Migration
  def change
    add_reference :pagamentos, :evento, index: true, foreign_key: true
  end
end
