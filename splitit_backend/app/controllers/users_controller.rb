class UsersController < ApplicationController
    before_action :ensure_logged_in, except: [:new, :create]

    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
    end

    def edit
      @user = User.find(params[:id])
    end

    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to projects_path
      else
        render :new
      end
    end

    def update
      # needs updating as we wont have traditional params
      @user = User.find(params[:id])

      if @user.update_attributes(user_params)
        return true
        # redirect_to user_url(@user)
      else
        # render :edit
        return false
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      return true
      # redirect_to users_url
    end

    private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end

end
