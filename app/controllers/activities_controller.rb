# frozen_string_literal: true

class ActivitiesController < AuthApiController
  def index
    params.require(:user_id)

    user_id = params['user_id']
    page = params['page']
    page_size = params['page_size']

    @activities = []
    @activities = Activity.where(user_id: user_id).order('created_at desc') if user_id.present?
    @activities = @activities.page(page.to_i).per(page_size.to_i) if page.present? && page_size.present?

    @total_count = @activities.length

    @message = 'getActivities'
    render :index, status: :ok
  rescue StandardError => e
    Rails.logger.debug "error = #{e}"

    @message = 'getActivities error'
    @error = e.message.to_s
    render :index, status: :bad_request
  end

  def show
    @message = 'getActivityById'
    @activity = Activity.find(params[:id])
    render :show, status: :ok
  rescue StandardError => e
    Rails.logger.debug "error = #{e}"

    @message = 'getActivityById error'
    @error = e.message.to_s
    render :show, status: :bad_request
  end
end
