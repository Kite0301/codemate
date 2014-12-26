json.array!(@inquiries) do |inquiry|
  json.extract! inquiry, :email, :content
  json.url inquiry_url(inquiry, format: :json)
end