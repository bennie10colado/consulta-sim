class Paciente < ApplicationRecord
  validates :nome_completo, presence: true
  validates :data_nascimento, presence: true
  validates :CPF, presence: true, uniqueness: true
  validates :email, presence: true

  has_one :endereco, :dependent => :destroy
  has_many :consultums

  accepts_nested_attributes_for :endereco
  accepts_nested_attributes_for :consultums
end
