class ActivitiesController < AuthApiController
  def index
    user_id = params['user_id']
    page = params['page']
    page_size = params['page_size']

    @activities = []
    @activities = Activity.where(user_id: user_id).order('created_at desc') if user_id.present?
    @activities = @activities.page(page.to_i).per(page_size.to_i) if page.present? && page_size.present?

    @total_count = @activities.length

    @message = 'getActivities'
    render :index, status: 200
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getActivities error'
    @error = e.message.to_s
    render :index, status: 400
  end

  def show
    @message = 'getActivityById'
    @activity = Activity.find(params[:id])
    render :show, status: 200
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getActivityById error'
    @error = e.message.to_s
    render :show, status: 400
  end
end
