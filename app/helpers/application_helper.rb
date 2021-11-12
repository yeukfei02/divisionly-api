module ApplicationHelper
  def self.create_activity(user, user_id, action, type)
    if user.present?
      username = "#{user.first_name} #{user.last_name}"

      uuid = SecureRandom.uuid
      title = uuid
      description = "#{username} #{action} #{type}"
      Activity.create!(title: title, description: description, user_id: user_id)
    end
  end
end
