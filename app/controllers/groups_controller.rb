class GroupsController < AuthApiController
  def create; end

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

  def show; end
end
