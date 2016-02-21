json.array!(@funcionarios) do |funcionario|
  json.extract! funcionario, :id, :precoHora1
  json.url funcionario_url(funcionario, format: :json)
end
