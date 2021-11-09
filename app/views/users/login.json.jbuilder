json.message @message
json.token @token if @token.present?

if @user.present?
  json.user do
    json.id @user.id
    json.email @user.email
    json.first_name @user.first_name
    json.last_name @user.last_name

    json.avatar do
      json.url @user.avatar.service_url
      json.filename @user.avatar.filename
    end

    json.created_at @user.created_at
    json.updated_at @user.updated_at
  end
end

json.error @error if @error.present?
