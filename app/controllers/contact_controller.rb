class ContactController < AuthApiController
  def contact_divisionly_support
    user_id = params['user_id']
    subject = params['subject']
    message = params['message']

    user = User.find(user_id)
    if user.present?
      username = "#{user.first_name} #{user.last_name}"

      formatted_message = "#{username}: #{message}"
      ContactMailer.contact_email(subject, formatted_message).deliver_now

      @message = 'contactDivisionlySupport'
      render :contact_divisionly_support, status: :ok
    else
      @message = 'contactDivisionlySupport error, user not found'
      render :contact_divisionly_support, status: :bad_request
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'contactDivisionlySupport error'
    @error = e.message.to_s
    render :contact_divisionly_support, status: :bad_request
  end
end