class Medico < ApplicationRecord
  validates :nome_completo, presence: true, length: {minimum: 5}, format: {with: /\A[^0-9`!@#$%^&*+_=,.]+\z/}
  validates :CPF, presence: true, length: {is: 11}, format: {without: /\A[a-zA-Z]\z/}, uniqueness: true
  validates :email, presence: true, length: {minimum: 5}, uniqueness: true, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}
  validates :especialidade, presence: true, length: {minimum: 5}, format: {with: /\A[^0-9`!@#$%^&*+_=]+\z/}
  validates :CRM, presence: true, length: {is: 6}, format: {without: /\A[a-zA-Z]\z/}

  has_many :consultums
  has_many :pacientes, :through => :consultums

  accepts_nested_attributes_for :consultums
end
