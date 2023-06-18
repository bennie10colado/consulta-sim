class Medico < ApplicationRecord
  has_many :consultums

  accepts_nested_attributes_for :consultums
end
