class Funcionario < ActiveRecord::Base
  has_many :trabalhos
  has_many :eventos, through: :trabalhos

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def regularizado
    Trabalho.where(:funcionario_id => self.id).where(:regularizado => false).empty?
  end

end
