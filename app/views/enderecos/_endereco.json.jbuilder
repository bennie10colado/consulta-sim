json.extract! endereco, :id, :CEP, :cidade, :bairro, :logradouro, :complemento, :created_at, :updated_at
json.url endereco_url(endereco, format: :json)
