class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :withdraw]
  before_action :check_guest, only: [:update, :withdraw]

  def index
    @users = User.all
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
    @user = User.find_by!(yourfoot_ID: params[:yourfoot_ID])
    @reviews = @user.review
    if @reviews.blank?
      @average_review = 0
    else
      @average_review = @reviews.average(:rating).round(2)
    end

    if @user.pickteam.nil?
    else
    #推しチームの継続日数を計算　〇日目と表記したいので （当日の日付- 変更日）に１日分追加する
      @duration = (Date.today + 1 - Date.parse(@user.pickteam.updated_at.to_s)).to_i
    end
  end

  def preview
    @user = User.find_by!(yourfoot_ID: params[:yourfoot_ID])
    @previews = @user.preview
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
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
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
