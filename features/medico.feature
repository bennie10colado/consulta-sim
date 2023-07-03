Feature: register doctor
  As a medical user
  I want to register a new doctor in the system
  So that the doctor is available for appointments

  Scenario Outline: create a doctor
    Given I am on the home page
    And I click on "<arg>"
    And I click on "<arg1>"
    When I fill all the fields Nome completo: <nome_completo>, cpf: <cpf>, Email: <email>, Especialidade: <especialidade>, crm: <crm>
    Then I should see the message "Medico was successfully created"

    Examples:
      | arg     | arg1        | nome_completo  | cpf            | email              | especialidade | crm      |
      | Medicos | New medico  | "Joao Marques" | "012345678910" | "medico@email.com" | "Cardio"      | "123456" |

  Scenario: doctor sees appointments
    Given I am on the home page
    And I click on "Medicos"
    And I click on "Show this medico"
    Then the page should display either the appointments or the message "Não há consultas agendadas para <nome do medico>"

