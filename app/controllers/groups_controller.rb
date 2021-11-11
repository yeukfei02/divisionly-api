class GroupsController < AuthApiController
  include ApplicationHelper

  def create
    name = params['name']
    description = params['description']
    group_type = params['group_type']
    image = params['image']
    user_id = params['user_id']

    is_type_correct = false
    is_type_correct = true if Group.types.has_value?(group_type)

    if is_type_correct
      group = Group.create!(name: name, description: description, group_type: group_type, image: image,
                            user_id: user_id)
      if group.present?
        user = User.find(user_id)
        ApplicationHelper.create_activity(user, user_id, 'create', 'group')

        @message = 'createGroup'
        render :create, status: 200
      else
        @message = 'createGroup error'
        render :create, status: 400
      end
    else
      @message = 'createGroup error, wrong type'
      render :create, status: 400
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'createGroup error'
    @error = e.message.to_s
    render :create, status: 400
  end

  def index
    user_id = params['user_id']

    @groups = []
    @groups = Group.where(user_id: user_id).order('created_at desc') if user_id.present?

    @message = 'getGroups'
    render :index, status: 200
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getGroups error'
    @error = e.message.to_s
    render :index, status: 400
  end

  def show
    @message = 'getGroupById'
    @group = Group.find(params[:id])
    render :show, status: 200
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getGroupById error'
    @error = e.message.to_s
    render :show, status: 400
  end

  def update
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
        ApplicationHelper.create_activity(user, user_id, 'update', 'group')

        @message = 'updateGroupById'
        render :update, status: 200
      else
        @message = 'updateGroupById error, no this group'
        render :update, status: 400
      end
    else
      @message = 'updateGroupById error, wrong type'
      render :update, status: 400
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'updateGroupById error'
    @error = e.message.to_s
    render :update, status: 400
  end

  def destroy
    group = Group.find(params[:id])
    if group.present?
      group.destroy

      @message = 'deleteGroupById'
      render :destroy, status: 200
    else
      @message = 'deleteGroupById error, no this group'
      render :destroy, status: 400
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'deleteGroupById error'
    @error = e.message.to_s
    render :destroy, status: 400
  end
end
