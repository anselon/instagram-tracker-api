json.array!(@photos) do |photo|
  json.extract! photo, :id, :username, :src_link, :native_link
  json.url photo_url(photo, format: :json)
end
