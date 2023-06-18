class Paciente < ApplicationRecord
  has_one :endereco, :dependent => :destroy
  has_many :consultums

  accepts_nested_attributes_for :endereco
  accepts_nested_attributes_for :consultums
end
