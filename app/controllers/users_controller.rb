class UsersController < ApplicationController
  include UsersHelper

  def signup
    email = params['email']
    password = params['password']
    avatar = params['avatar']

    hash_password = UsersHelper.get_hash_password(password)

    user = User.create!(email: email, password: hash_password, avatar: avatar)
    if user.present?
      @message = 'signup'
      render :signup, status: 200
    else
      @message = 'signup error'
      render :signup, status: 400
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'signup error'
    @error = e.message.to_s
    render :signup, status: 400
  end

  def login
    email = params['email']
    password = params['password']

    user = User.find_by(email: email)
    if user.present?
      hash_password_from_db = BCrypt::Password.new(user.password)
      if hash_password_from_db == password
        @token = UsersHelper.get_jwt_token(email)

        @message = 'login'
        @user_id = user.id
        render :login, status: 200
      else
        @message = 'login error, wrong password'
        render :login, status: 400
      end
    else
      @message = 'login error, user not found'
      render :login, status: 400
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'login error'
    @error = e.message.to_s
    render :login, status: 400
  end

  def index
    @message = 'getUsers'
    @users = User.all
    render :index, status: 200
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getUsers error'
    @error = e.message.to_s
    render :index, status: 400
  end

  def show
    @message = 'getUserById'
    @user = User.find(params[:id])
    render :show, status: 200
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getUserById error'
    @error = e.message.to_s
    render :show, status: 400
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
        render :change_password, status: 200
      else
        @message = 'changePassword error, old password is wrong'
        render :change_password, status: 400
      end
    end
  rescue StandardError => e
    @message = 'changePassword error'
    @error = e.message.to_s
    render :change_password, status: 400
  end
end
