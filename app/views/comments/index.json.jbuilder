json.array!(@comments) do |comment|
  json.extract! comment, :id, :dicussion_id, :parent_id, :author_id, :text
  json.url comment_url(comment, format: :json)
end
