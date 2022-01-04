class GroupsController < AuthApiController
  include ApplicationHelper

  def create
    params.require(%i[name description group_type user_id image])
    permitted = params.permit(%i[name description group_type user_id image])

    group_type = permitted['group_type']
    user_id = permitted['user_id']

    is_type_correct = false
    is_type_correct = true if Group.types.has_value?(group_type)

    if is_type_correct
      group = Group.create!(permitted)
      if group.present?
        user = User.find(user_id)
        ApplicationHelper.create_activity(user, user_id, 'created', 'group')

        @message = 'createGroup'
        render :create, status: :ok
      else
        @message = 'createGroup error'
        render :create, status: :bad_request
      end
    else
      @message = 'createGroup error, wrong type'
      render :create, status: :bad_request
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'createGroup error'
    @error = e.message.to_s
    render :create, status: :bad_request
  end

  def index
    params.require(:user_id)

    user_id = params['user_id']
    page = params['page']
    page_size = params['page_size']

    @groups = []
    @groups = Group.where(user_id: user_id).order('created_at desc') if user_id.present?
    @groups = @groups.page(page.to_i).per(page_size.to_i) if page.present? && page_size.present?

    @total_count = @groups.length

    @message = 'getGroups'
    render :index, status: :ok
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getGroups error'
    @error = e.message.to_s
    render :index, status: :bad_request
  end

  def show
    @message = 'getGroupById'
    @group = Group.find(params[:id])
    render :show, status: :ok
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getGroupById error'
    @error = e.message.to_s
    render :show, status: :bad_request
  end

  def update
    params.require(%i[name description group_type user_id])

    name = params['name']
    description = params['description']
    group_type = params['group_type']
    user_id = params['user_id']
    image = params['image']

    is_type_correct = false
    is_type_correct = true if Group.types.has_value?(group_type)

    if is_type_correct
      group = Group.find(params[:id])
      if group.present?
        group.update!(name: name, description: description, group_type: group_type, image: image)

        user = User.find(user_id)
        ApplicationHelper.create_activity(user, user_id, 'updated', 'group')

        @message = 'updateGroupById'
        render :update, status: :ok
      else
        @message = 'updateGroupById error, no this group'
        render :update, status: :bad_request
      end
    else
      @message = 'updateGroupById error, wrong type'
      render :update, status: :bad_request
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'updateGroupById error'
    @error = e.message.to_s
    render :update, status: :bad_request
  end

  def remove_group
    params.require(%i[id user_id])

    group = Group.find(params['id'])
    if group.present?
      group.destroy

      user_id = params['user_id']
      user = User.find(user_id)
      ApplicationHelper.create_activity(user, user_id, 'removed', 'group')

      @message = 'deleteGroupById'
      render :remove_group, status: :ok
    else
      @message = 'deleteGroupById error, no this group'
      render :remove_group, status: :bad_request
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'deleteGroupById error'
    @error = e.message.to_s
    render :remove_group, status: :bad_request
  end
end
