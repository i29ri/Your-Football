class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :withdraw]
  before_action :check_guest, only: [:update ,:withdraw]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by!(yourfoot_ID: params[:yourfoot_ID])
  end

  def preview
  end

  def edit
    @user = User.find_by!(yourfoot_ID: params[:yourfoot_ID])
  end

  def update
    @pickteam = Pickteam.find_by(user_id: current_user.id)
    if @pickteam.nil?
      @team = Team.find(params[:user][:id])
      @pickteam = Pickteam.new
      @pickteam.user_id = current_user.id
      @pickteam.team_id = @team.id
      @pickteam.save
    else
      @pickteam.update(pickteam_params)
      @team = Team.find(params[:user][:id])
      @pickteam.team_id = @team.id
      @pickteam.save
    end
    @user = User.find_by!(yourfoot_ID: params[:yourfoot_ID])
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  def followers
    @user = User.find_by!(yourfoot_ID: params[:yourfoot_ID])
    @users = @user.followers
  end

  def followings
    @user = User.find_by!(yourfoot_ID: params[:yourfoot_ID])
    @users = @user.followings
  end


  def unsubscribe
    @user = User.find_by!(yourfoot_ID: params[:yourfoot_ID])
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :introduction, :profile_image)
  end
  def pickteam_params
    params.require(:user).permit(:team_id)
  end

  def ensure_correct_user
    @user = User.find_by!(yourfoot_ID: params[:yourfoot_ID])
    if current_user.id != @user.id
      redirect_back(fallback_location: root_path)
    end
  end
  def check_guest
    if current_user.email == 'test1@test.co.jp'
      flash[:danger] = "テストユーザーのため編集できません"
      redirect_to user_path(current_user)
    end
  end

end
