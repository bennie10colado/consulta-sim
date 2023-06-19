class Consultum < ApplicationRecord
  belongs_to :paciente
  belongs_to :medico
  validates :data, presence: true, comparison: {greater_than: Date.today}
  validates :horario, presence: true

end
