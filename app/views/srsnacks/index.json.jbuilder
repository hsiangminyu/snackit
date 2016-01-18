json.array!(@srsnacks) do |srsnack|
  json.extract! srsnack, :id, :name, :follow_count, :photo, :pchome_url
  json.url srsnack_url(srsnack, format: :json)
end
