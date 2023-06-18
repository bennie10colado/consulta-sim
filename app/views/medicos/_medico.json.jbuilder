json.extract! medico, :id, :nome_completo, :CPF, :email, :especialidade, :CRM, :created_at, :updated_at
json.url medico_url(medico, format: :json)
