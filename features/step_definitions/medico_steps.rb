#Scenary 1
Given('I am on the home') do
  visit root_path
end

Given('I click on New medico') do
  click_link "New medico"
end

When('I fill all the fields Nome completo: {string}, cpf: {string}, Email: {string}, Especialidade: {string}, crm: {string}') do |nome_completo, cpf, email, especialidade, crm|
  fill_in 'Nome completo', with: nome_completo
  fill_in 'CPF', with: cpf
  fill_in 'Email', with: email
  fill_in 'Especialidade', with: especialidade
  fill_in 'CRM', with: crm
end

Then('I should see the message "Medico was successfully created"') do |message|
  expect(page).to have_content(message)
end

And(/^I click on "([^"]*)"$/) do |_|
  pending
end




#Scenery 2