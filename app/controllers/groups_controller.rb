class GroupsController < AuthApiController
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
end
