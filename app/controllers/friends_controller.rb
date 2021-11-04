class FriendsController < AuthApiController
  def create
    title = params['title']
    description = params['description']
    phone_number = params['phone_number']
    user_id = params['user_id']

    friend = Friend.create(title: title, description: description, phone_number: phone_number, user_id: user_id)
    if friend.present?
      @message = 'createFriend'
      render :create, status: 200
    else
      @message = 'createFriend error'
      render :create, status: 400
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'createFriend error'
    @error = e.message.to_s
    render :create, status: 400
  end

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

  def show
    @message = 'getFriendById'
    @friend = Friend.find(params[:id])
    render :show, status: 200
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getFriendById error'
    @error = e.message.to_s
    render :show, status: 400
  end
end
