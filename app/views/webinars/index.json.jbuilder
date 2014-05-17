json.array!(@webinars) do |webinar|
  json.extract! webinar, :id, :date, :subject, :detail, :presenter, :info, :url
  json.url webinar_url(webinar, format: :json)
end
