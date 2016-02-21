class Evento < ActiveRecord::Base
  has_many :trabalhos
  has_many :funcionarios, through: :trabalhos

  def save
    self.dataInicioEvento = dataInicio.to_time + (horaInicio.hour * 60 * 60) + (horaInicio.min * 60)
    self.dataFimEvento = dataInicio.to_time  + 1.day +  (horaFim.hour * 60 * 60) + (horaFim.min * 60)
    super
  end

  def dataInicioFormatted format = "%d/%m/%Y - %H:%M"
    if !dataInicioEvento.nil?
      dataInicioEvento.strftime(format)
    end
  end

  def dataFimFormatted format = "%d/%m/%Y - %H:%M"
    if !dataInicioEvento.nil?
      dataFimEvento.strftime(format)
    end
  end
end
