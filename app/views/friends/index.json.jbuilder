json.message @message
json.friends @friends do |friend|
  json.id friend.id
  json.name friend.name
  json.description friend.description
  json.phone_number friend.phone_number

  json.avatar do
    json.url friend.avatar.service_url
    json.filename friend.avatar.filename
  end

  json.user do
    json.id friend.user.id
    json.email friend.user.email
    json.first_name friend.user.first_name
    json.last_name friend.user.last_name
    json.created_at friend.user.created_at
    json.updated_at friend.user.updated_at
  end

  json.created_at friend.created_at
  json.updated_at friend.updated_at
end
json.error @error if @error.present?
