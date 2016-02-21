json.array!(@eventos) do |evento|
  json.extract! evento, :id, :precoHora1
  json.url evento_url(evento, format: :json)
end
