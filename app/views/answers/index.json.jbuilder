json.array!(@answers) do |answer|
  json.extract! answer, :user_id, :post_id, :content
  json.url answer_url(answer, format: :json)
end