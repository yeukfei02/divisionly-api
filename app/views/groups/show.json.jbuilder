json.message @message
if @group.present?
  json.group do
    json.id @group.id
    json.name @group.name
    json.description @group.description
    json.group_type @group.group_type

    json.image do
      json.url @group.image.service_url
      json.filename @group.image.filename
    end

    json.user do
      json.id @group.user.id
      json.email @group.user.email
      json.created_at @group.user.created_at
      json.updated_at @group.user.updated_at
    end

    json.created_at @group.created_at
    json.updated_at @group.updated_at
  end
end
json.error @error if @error.present?
