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

When('I click on "Create Medico"') do
  click_button "Create Medico"
end

Then('I should see the message "Medico was successfully created"') do |message|
  expect(page).to have_content(message)
end





#Scenery 2

Given('I am on the home page') do
  visit root_path
end

When('I click on "Medicos"') do
  click_link "Medicos"
end

Given('Exists one doctor registered in the system') do
  Medico.create(
    nome_completo: "Jotinha",
    CPF: "12345678910",
    email: "jotinhaa@email.com",
    especialidade: "Cardiologia",
    CRM: "123459"
  )
end

When('I click on "{string}"') do |botao|
  click_on "d-#{botao}"
end

Then('the page should display either the appointments or the message "Não há consultas agendadas para"') do
  if page.has_content?('Consultas agendadas para')
    expect(page).to have_selector('.appointment-item')
  else
    expect(page).to have_content("Não há consultas agendadas para")
  end
end
