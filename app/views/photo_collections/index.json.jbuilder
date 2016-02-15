json.array!(@photo_collections) do |photo_collection|
  json.extract! photo_collection, :id, :tag, :start_date, :end_date
  json.url photo_collection_url(photo_collection, format: :json)
end
