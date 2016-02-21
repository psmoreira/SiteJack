class AddHoraInicioToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :horaInicio, :time
    add_column :eventos, :horaFim, :time
    add_column :eventos, :duracaoEvento, :time
  end
end
