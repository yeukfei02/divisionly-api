class ActivitiesController < AuthApiController
  def index
    @message = 'getActivities'
    @activities = Activity.all
    render :index, status: 200
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getActivities error'
    @error = e.message.to_s
    render :index, status: 400
  end
end
