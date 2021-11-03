class ActivitiesController < AuthApiController
  def create; end

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

  def show; end
end
