class GroupsController < AuthApiController
  def create
    name = params['name']
    description = params['description']
    type = params['type']
    user_id = params['user_id']

    group = Group.create(name: name, description: description, type: type, user_id: user_id)
    if group.present?
      @message = 'createGroup'
      render :create, status: 200
    else
      @message = 'createGroup error'
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
