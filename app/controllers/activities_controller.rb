class ActivitiesController < AuthApiController
  def get_activities
    @message = 'getActivities'
    @activities = Activity.all
    render :get_activities, status: 200
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getActivities error'
    @error = e.message.to_s
    render :get_activities, status: 400
  end
end
