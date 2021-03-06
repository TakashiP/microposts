class UsersController < ApplicationController
before_action :set_user, only: [:edit, :update]
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    if @user != current_user
      redirect_to root_url
    end
  end
  
  def update
    if @user == current_user
      if @user.update(user_params)
        # 保存に成功した場合はプロフィールページへリダイレクト
        redirect_to @user , notice: 'プロフィールを編集しました'
      else
        # 保存に失敗した場合は編集画面へ戻す
        render 'edit'
      end
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :personal_info, :address, :password,
                                 :password_confirmation)
  end
  def set_user
    @user = User.find(params[:id])
  end

end
