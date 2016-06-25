json.array!(@pulications) do |pulication|
  json.extract! pulication, :id, :type, :nature, :reach, :authors, :organizer, :vehicle
  json.url pulication_url(pulication, format: :json)
end
