json.extract! cliente, :id, :nome, :email, :descricao, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
