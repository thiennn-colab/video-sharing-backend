json.data do
  json.array! @articles do |article|
    json.id article
  end
end
