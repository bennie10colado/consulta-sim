require "test_helper"

class PacienteTest < ActiveSupport::TestCase
  test "salvar paciente com campos vazios" do
    paciente = Paciente.new(nome_completo: '', data_nascimento: '', CPF: '', email: '')
    assert_not paciente.save, "Salvar paciente sem dados"
  end

  test "salvar paciente válido" do
    paciente = Paciente.new(nome_completo: 'Marquinhos da Silva Peres', CPF: '11111111111', email: 'email@email.com',
data_nascimento: Date.new(1990, 10, 20))
    assert paciente.save, "Paciente salvo com sucesso"
  end

  test "salvar paciente com nome e email inválidos" do
    paciente = Paciente.new(nome_completo: 'Marcos Vini 10', CPF: '11111111111', email: 'email',
                            data_nascimento: Date.new(1990, 10, 20))
    assert_not paciente.save, "Paciente não foi salvo"
  end

end
