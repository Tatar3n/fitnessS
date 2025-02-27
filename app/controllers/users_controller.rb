class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # пока все пользователи и атлеты, и судьи
      @user.roles.create(role_name: :athlete)
      @user.roles.create(role_name: :referee)
      session[:current_user_id] = @user.id
      redirect_to root_path, notice: "Регистрация прошла успешно."
    else
      redirect_to register_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Информация обновлена успешно."
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user)
          .permit(:email, :password, :password_confirmation, :first_name, :last_name, :middle_name, :birthday, :weight)
  end
end
