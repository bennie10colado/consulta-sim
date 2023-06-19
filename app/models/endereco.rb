class Endereco < ApplicationRecord
  belongs_to :paciente
  validates :CEP, presence: true, length: {is: 8}
  validates :cidade, presence: true, length: {minimum: 5}, format: {with: /\A[^0-9`!@#$%^&*+_=,.]+\z/}
  validates :bairro, presence: true, length: {minimum: 5}, format: {with: /\A[^0-9`!@#$%^&*+_=,.]+\z/}
  validates :logradouro, presence: true, length: {minimum: 5}, format: {with: /\A[^0-9`!@#$%^&*+_=,.]+\z/}
  validates :complemento, presence: true, length: {minimum: 5}, format: {with: /\A[^0-9`!@#$%^&*+_=,.]+\z/}

end
