Feature: Registrar Paciente
  As a paciente
  I want to register a new patient in the system
  So that the patient can schedule an appointment

  Scenario: Register a paciente
    Given I am on the New paciente
    When I fill in the following information:
      | nome_completo    | Jeremias Silva    |
      | data_nascimento  | 15/10/2003        |
      | CPF              | 12345678910       |
      | email            | jotinha@email.com |
      | CEP              | 55299555          |
      | cidade           | Jaboatao          |
      | bairro           | Heliopolis        |
      | logradouro       | Apartamento       |
      | complemento      | Vizinho ao mercado|
    And I click on the button Create Paciente
    Then I should see the message "Paciente was successfully created with Endereco"

  #Scenario: Delete a Paciente
