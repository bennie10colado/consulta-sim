require "test_helper"

class ConsultumTest < ActiveSupport::TestCase

  test "salvar consulta com campos vazios" do
    consulta = Consultum.new(data: '', horario: '', medico: nil, paciente: nil)
    assert_not consulta.save, "Salvar consulta sem dados (não foi salvo)"
  end

  test "uma consulta pertence a um médico" do
    medico = Medico.create(nome_completo: 'Dr. João', CPF: '12345678901', email: 'medico@email.com', especialidade: 'Cardiologia', CRM: '123456')
    consulta = Consultum.new(data: Date.today + 1.day, horario: '10:00', medico: medico)
    #consulta.medico = medico
    consulta.save

    assert_equal medico, consulta.medico, "A consulta pertence ao médico correto"
  end

end
