class UsersController < ApplicationController
  
  def show # 追加
    @user = User.find(params[:id])
    flash[:success] = "This page is your own page/"
  end
  
  def new
    @user = User.new
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
  
  #def edit
  #  @user = User.edit(user_params)
  #  if @user.save
  #    flash[:success] = "#"
  #    redirect_to @user
  #  else
  #    render 'new'
  #  end
  #end
  
  def edit 
    @user = User.edit(user_params)
     if @user.save
      flash[:success] = "Please fill in Profiles"
      redirect_to edit_user_path #edit.html.erbに飛ばしたい
     else
      render 'new'
     end
  end
  
  # def update
    # @user = User.update(user_params)
    # if @user.save
      # flash[:success] = "#"
     # redirect_to @user
    # else
    #  render 'new'
   # end
  # end

  def update
    @user = User.update(user_params)
    if @User.update(message_params)
      redirect_to root_path , notice: 'プロフィールを編集しました'
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end