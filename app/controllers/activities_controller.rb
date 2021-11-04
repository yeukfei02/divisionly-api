class ActivitiesController < AuthApiController
  def create
    title = params['title']
    description = params['description']
    image = params['image']
    user_id = params['user_id']

    activity = Activity.create!(title: title, description: description, image: image, user_id: user_id)
    if activity.present?
      @message = 'createActivity'
      render :create, status: 200
    else
      @message = 'createActivity error'
      render :create, status: 400
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'createActivity error'
    @error = e.message.to_s
    render :create, status: 400
  end

  def index
    user_id = params['user_id']

    @activities = []
    @activities = Activity.where(user_id: user_id).order('created_at desc') if user_id.present?

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
