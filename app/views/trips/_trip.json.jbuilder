# json.extract! trip, :id, :user_id, :title, :image_url, :start_time, :end_time, :trip.places
# , :created_at, :updated_at
# json.url trip_url(trip, format: :json)
json.id trip.id
json.title trip.title
json.image_url trip.image_url
json.start_time trip.start_time
json.end_time trip.end_time
json.places trip.places
