class AddHorainicioToTrabalhos < ActiveRecord::Migration
  def change
    add_column :trabalhos, :horaInicio, :time
    add_column :trabalhos, :horaFim, :time
    add_column :trabalhos, :duracaoTrabalho, :time
    add_column :trabalhos, :dataTrabalho, :date
    add_column :trabalhos, :dataHoraInicio, :datetime
    add_column :trabalhos, :dataHoraFim, :datetime
  end
end
