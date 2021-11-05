json.message @message
if @activity.present?
  json.activity do
    json.id @activity.id
    json.title @activity.title
    json.description @activity.description

    json.image do
      json.url @activity.image.service_url
      json.filename @activity.image.filename
    end

    json.user do
      json.id @activity.user.id
      json.email @activity.user.email
      json.created_at @activity.user.created_at
      json.updated_at @activity.user.updated_at
    end

    json.created_at @activity.created_at
    json.updated_at @activity.updated_at
  end
end
json.error @error if @error.present?
