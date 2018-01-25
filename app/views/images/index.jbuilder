json.count images.count
json.images images.each do |image|
  json.id image.id
  json.url image.url
  json.source_url image.source_url
end