class AddEventoToTrabalho < ActiveRecord::Migration
  def change
    add_reference :trabalhos, :evento, index: true, foreign_key: true
  end
end
