class UsersController < ApplicationController
  include UsersHelper

  def signup
    request_body = params
    email = request_body['email']
    password = request_body['password']

    hash_password = UsersHelper.get_hash_password(password)

    user = User.create(email: email, password: hash_password)

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
    request_body = params
    email = request_body['email']
    password = request_body['password']

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

  def get_users
    @message = 'getUsers'
    @users = User.all
    render :get_users, status: 200
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getUsers error'
    @error = e.message.to_s
    render :get_users, status: 400
  end

  def get_user_by_id
    @message = 'getUserById'
    @user = User.find(params[:id])
    render :get_user_by_id, status: 200
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getUserById error'
    @error = e.message.to_s
    render :get_user_by_id, status: 400
  end
end
