class Paciente < ApplicationRecord
  validates :nome_completo, presence: true, length: {minimum: 4}, format: {with: /\A[^0-9`!@#$%^&*+_=,.]+\z/}
  validates :data_nascimento, presence: true, comparison: {less_than: Date.today, greater_than: Date.new(1850, 1, 1)}
  validates :CPF, presence: true, length: {is: 11}, format: {without: /\A[a-zA-Z]\z/}, uniqueness: true
  validates :email, presence: true, length: {minimum: 4}, uniqueness: true, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}

  has_one :endereco, :dependent => :destroy
  has_many :consultums
  has_many :medicos, :through =>:consultums

  accepts_nested_attributes_for :endereco
  accepts_nested_attributes_for :consultums
end
