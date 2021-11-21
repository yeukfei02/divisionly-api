class UsersController < AuthApiController
  include UsersHelper

  before_action :validate_jwt_token, only: :change_password

  def signup
    email = params['email']
    password = params['password']
    first_name = params['first_name']
    last_name = params['last_name']
    avatar = params['avatar']

    hash_password = UsersHelper.get_hash_password(password)

    user = User.create!(email: email, password: hash_password, first_name: first_name, last_name: last_name,
                        avatar: avatar)
    if user.present?
      @message = 'signup'
      render :signup, status: :ok
    else
      @message = 'signup error'
      render :signup, status: :bad_request
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'signup error'
    @error = e.message.to_s
    render :signup, status: :bad_request
  end

  def login
    email = params['email']
    password = params['password']

    @user = User.find_by(email: email)
    if @user.present?
      hash_password_from_db = BCrypt::Password.new(@user.password)
      if hash_password_from_db == password
        @token = UsersHelper.get_jwt_token(email)

        @message = 'login'
        render :login, status: :ok
      else
        @message = 'login error, wrong password'
        render :login, status: :bad_request
      end
    else
      @message = 'login error, user not found'
      render :login, status: :bad_request
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'login error'
    @error = e.message.to_s
    render :login, status: :bad_request
  end

  def upload
    file = params['file']

    if file.present?
      @message = 'user file upload success'
      render :upload, status: :ok
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'user file upload error'
    @error = e.message.to_s
    render :upload, status: :bad_request
  end

  def index
    @message = 'getUsers'
    @users = User.all.order('created_at desc')
    render :index, status: :ok
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getUsers error'
    @error = e.message.to_s
    render :index, status: :bad_request
  end

  def show
    @message = 'getUserById'
    @user = User.find(params[:id])
    render :show, status: :ok
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getUserById error'
    @error = e.message.to_s
    render :show, status: :bad_request
  end

  def change_password
    old_password = params['old_password']
    new_password = params['new_password']

    user = User.find(params[:id])
    if user.present?
      user_password_from_db = BCrypt::Password.new(user.password)
      if user_password_from_db == old_password
        hash_new_password = UsersHelper.get_hash_password(new_password)
        user.update!(password: hash_new_password)

        @message = 'changePassword'
        render :change_password, status: :ok
      else
        @message = 'changePassword error, old password is wrong'
        render :change_password, status: :bad_request
      end
    end
  rescue StandardError => e
    @message = 'changePassword error'
    @error = e.message.to_s
    render :change_password, status: :bad_request
  end

  def update_user
    user_id = params['user_id']

    user = User.find(user_id)
    if user.present?
      first_name = params['first_name']
      last_name = params['last_name']
      avatar = params['avatar']
      user.update!(first_name: first_name, last_name: last_name, avatar: avatar)

      @message = 'updateUser'
      render :update_user, status: :ok
    else
      @message = 'updateUser error, user not found'
      render :update_user, status: :bad_request
    end
  rescue StandardError => e
    @message = 'updateUser error'
    @error = e.message.to_s
    render :update_user, status: :bad_request
  end
end
