json.array!(@trabalhos) do |trabalho|
  json.extract! trabalho, :id, :precoHora1
  json.url trabalho_url(trabalho, format: :json)
end
