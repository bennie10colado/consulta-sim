Given('I am on the New paciente') do
  visit new_paciente_path
end

When('I fill in the following information:') do |table|
  data = table.rows_hash
  fill_in 'Nome completo', with: data['nome_completo']
  fill_in 'Data nascimento', with: data['data_nascimento']
  fill_in 'Cpf', with: data['CPF']
  fill_in 'Email', with: data['email']
  fill_in 'Cep', with: data['CEP']
  fill_in 'Cidade', with: data['cidade']
  fill_in 'Bairro', with: data['bairro']
  fill_in 'Logradouro', with: data['logradouro']
  fill_in 'Complemento', with: data['complemento']
end

When('I click on the button Create Paciente') do
  click_button("Create Paciente")
end

Then('I should see the message "Paciente was successfully created with Endereco"') do
  expect(page).to have_content('Paciente was successfully created')
end

