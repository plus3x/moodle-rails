json.array!(@discussions) do |discussion|
  json.extract! discussion, :id, :title, :question, :course_id
  json.url discussion_url(discussion, format: :json)
end
