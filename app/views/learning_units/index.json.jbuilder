json.array!(@learning_units) do |learning_unit|
  json.extract! learning_unit, :id, :title, :course_id
  json.url learning_unit_url(learning_unit, format: :json)
end
