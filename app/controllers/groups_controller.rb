class GroupsController < AuthApiController
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
    @message = 'getGroups'
    @groups = Group.all
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
end
