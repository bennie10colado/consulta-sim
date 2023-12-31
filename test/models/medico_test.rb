require 'test_helper'

class MedicoTest < ActiveSupport::TestCase

  test "salvar medico com campos vazios" do
    medico = Medico.new(nome_completo: '', CPF: '', email: '', especialidade: '', CRM: '')
    assert_not medico.save, "Salvar medico sem dados (não foi salvo)"
  end

  test "nome completo do médico deve ter pelo menos 5 caracteres" do
    medico = Medico.new(nome_completo: 'X')
    assert_not medico.save, "Salvar medico com nome menor que 5 caracteres (não foi salvo)"
  end

  test "nome completo do médico não pode conter numeros" do
    medico = Medico.new(nome_completo: 'Jô Soares 123')
    assert_not medico.save, "Salvar medico com nome com numeros (não foi salvo)"
  end

  test "nome completo do médico não pode conter caracteres especiais" do
    medico = Medico.new(nome_completo: 'Jô Soares!')
    assert_not medico.save, "Salvar medico com nome com caractere especial (não foi salvo)"
  end

  test "salvar medico valido" do
    medico = Medico.new(nome_completo: 'Jô Soares', CPF: "11111111119", email: "email_medico@email.com", especialidade: "ornitorrinco", CRM: "234567")
    assert medico.save, "Salvar medico valido"
  end
end
