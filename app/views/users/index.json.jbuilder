json.message @message
json.users @users do |user|
  json.id user.id
  json.email user.email
  # json.avatar user.avatar
  json.created_at user.created_at
  json.updated_at user.updated_at
end
json.error @error if @error.present?
