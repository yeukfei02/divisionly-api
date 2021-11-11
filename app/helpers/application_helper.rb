module ApplicationHelper
  def self.create_activity(user, user_id, action, type)
    if user.present?
      username = "#{user.first_name} #{user.last_name}"

      action_str = case action
                   when 'create'
                     'created'
                   when 'update'
                     'updated'
                   else
                     ''
                   end

      title = "#{username} #{action_str} #{type}"
      description = "#{username} #{action_str} #{type}"
      Activity.create!(title: title, description: description, user_id: user_id)
    end
  end
end
