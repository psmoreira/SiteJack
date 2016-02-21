class Trabalho < ActiveRecord::Base
  belongs_to :evento
  belongs_to :funcionario
  has_many :pagamento
  def save
    if !dataTrabalho.nil?
      self.dataHoraInicio = dataTrabalho.to_time + (horaInicio.hour * 60 * 60) + (horaInicio.min * 60)
      self.dataHoraFim = dataTrabalho.to_time  + 1.day +  (horaFim.hour * 60 * 60) + (horaFim.min * 60)
    end
    super
  end

end
