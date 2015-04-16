json.array!(@activities) do |activity|
  json.extract! activity, :id, :title, :learning_unit_id
  json.url activity_url(activity, format: :json)
end
