class FriendsController < AuthApiController
  def create
    name = params['name']
    description = params['description']
    phone_number = params['phone_number']
    avatar = params['avatar']
    user_id = params['user_id']

    friend = Friend.create!(name: name, description: description, phone_number: phone_number.to_i, avatar: avatar,
                            user_id: user_id)
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
    user_id = params['user_id']

    @friends = []
    @friends = Friend.where(user_id: user_id).order('created_at desc') if user_id.present?

    @message = 'getFriends'
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

  def update
    name = params['name']
    description = params['description']
    phone_number = params['phone_number']
    avatar = params['avatar']

    friend = Friend.find(params[:id])
    if friend.present?
      friend.update!(name: name, description: description, phone_number: phone_number.to_i, avatar: avatar)

      @message = 'updateFriendById'
      render :update, status: 200
    else
      @message = 'updateFriendById error, no this friend'
      render :update, status: 400
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'updateFriendById error'
    @error = e.message.to_s
    render :update, status: 400
  end

  def destroy
    friend = Friend.find(params[:id])
    if friend.present?
      friend.destroy

      @message = 'deleteFriendById'
      render :destroy, status: 200
    else
      @message = 'deleteFriendById error, no this friend'
      render :destroy, status: 400
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'deleteFriendById error'
    @error = e.message.to_s
    render :destroy, status: 400
  end
end
