json.array!(@pagamentos) do |pagamento|
  json.extract! pagamento, :id, :precoHora1
  json.url pagamento_url(pagamento, format: :json)
end
