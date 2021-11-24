class FriendsController < AuthApiController
  include ApplicationHelper

  def create
    params.require(%i[name description phone_number user_id avatar])
    permitted = params.permit(%i[name description phone_number user_id avatar])

    user_id = permitted['user_id']

    friend = Friend.create!(permitted)
    if friend.present?
      user = User.find(user_id)
      ApplicationHelper.create_activity(user, user_id, 'created', 'friend')

      @message = 'createFriend'
      render :create, status: :ok
    else
      @message = 'createFriend error'
      render :create, status: :bad_request
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'createFriend error'
    @error = e.message.to_s
    render :create, status: :bad_request
  end

  def index
    params.require(:user_id)

    user_id = params['user_id']
    page = params['page']
    page_size = params['page_size']

    @friends = []
    @friends = Friend.where(user_id: user_id).order('created_at desc') if user_id.present?
    @friends = @friends.page(page.to_i).per(page_size.to_i) if page.present? && page_size.present?

    @total_count = @friends.length

    @message = 'getFriends'
    render :index, status: :ok
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getFriends error'
    @error = e.message.to_s
    render :index, status: :bad_request
  end

  def show
    @message = 'getFriendById'
    @friend = Friend.find(params[:id])
    render :show, status: :ok
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getFriendById error'
    @error = e.message.to_s
    render :show, status: :bad_request
  end

  def update
    params.require(%i[name description phone_number user_id avatar])

    name = params['name']
    description = params['description']
    phone_number = params['phone_number']
    user_id = params['user_id']
    avatar = params['avatar']

    friend = Friend.find(params[:id])
    if friend.present?
      friend.update!(name: name, description: description, phone_number: phone_number.to_i, avatar: avatar)

      user = User.find(user_id)
      ApplicationHelper.create_activity(user, user_id, 'updated', 'friend')

      @message = 'updateFriendById'
      render :update, status: :ok
    else
      @message = 'updateFriendById error, no this friend'
      render :update, status: :bad_request
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'updateFriendById error'
    @error = e.message.to_s
    render :update, status: :bad_request
  end

  def remove_friend
    params.require(%i[id user_id])

    friend = Friend.find(params[:id])
    if friend.present?
      friend.destroy

      user_id = params['user_id']
      user = User.find(user_id)
      ApplicationHelper.create_activity(user, user_id, 'removed', 'friend')

      @message = 'deleteFriendById'
      render :remove_friend, status: :ok
    else
      @message = 'deleteFriendById error, no this friend'
      render :remove_friend, status: :bad_request
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'deleteFriendById error'
    @error = e.message.to_s
    render :remove_friend, status: :bad_request
  end
end
