class FriendsController < AuthApiController
  def create; end

  def index
    @message = 'getFriends'
    @friends = Friend.all
    render :index, status: 200
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getFriends error'
    @error = e.message.to_s
    render :index, status: 400
  end

  def show; end
end
