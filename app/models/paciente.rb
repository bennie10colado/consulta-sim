class Paciente < ApplicationRecord
  has_one :endereco, :dependent => :destroy
  accepts_nested_attributes_for :endereco
end
