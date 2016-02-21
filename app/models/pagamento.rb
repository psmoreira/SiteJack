class Pagamento < ActiveRecord::Base
  belongs_to :evento
  belongs_to :funcionario
  belongs_to :trabalho
end
