#scenery 1
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

Given('I click on the button Create Paciente') do
  click_button("Create Paciente")
end

Then('I should see the message "Paciente was successfully created with Endereco"') do
  expect(page).to have_content('Paciente was successfully created')
end

#scenery 2

Given('there is a registered paciente with the following information:') do |table|
  paciente_info = table.rows_hash
  Paciente.create(paciente_info)
end

Given('I am on the Pacientes page') do
  visit pacientes_path
end

And('I click on the link {string} of who I want to delete') do |link_label|
  click_on(link_label)
end

When('I click on the button "Destroy this paciente" for the paciente {string}') do |paciente_name|
  click_on("Destroy this paciente")
end

Then('should appear in the system page the message "Paciente was successfully destroyed"') do
  expect(page).to have_content("Paciente was successfully destroyed")
end



