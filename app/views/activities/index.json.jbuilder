json.array!(@activities) do |activity|
  json.extract! activity, :id, :title, :course_id, :learning_unit_id
  json.url activity_url(activity, format: :json)
end
