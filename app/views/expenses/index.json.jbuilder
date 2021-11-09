json.message @message
json.expenses @expenses do |expense|
  json.id expense.id
  json.description expense.description
  json.amount expense.amount
  json.split_method expense.split_method

  json.image do
    json.url expense.image.service_url
    json.filename expense.image.filename
  end

  json.user do
    json.id expense.user.id
    json.email expense.user.email
    json.first_name expense.user.first_name
    json.last_name expense.user.last_name
    json.created_at expense.user.created_at
    json.updated_at expense.user.updated_at
  end

  json.group do
    json.id expense.group.id
    json.name expense.group.name
    json.description expense.group.description
    json.created_at expense.group.created_at
    json.updated_at expense.group.updated_at
  end

  json.created_at expense.created_at
  json.updated_at expense.updated_at
end
json.error @error if @error.present?
