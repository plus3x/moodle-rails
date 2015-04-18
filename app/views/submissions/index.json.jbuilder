json.array!(@submissions) do |submission|
  json.extract! submission, :id, :comment, :author_id, :activity_id
  json.url submission_url(submission, format: :json)
end
