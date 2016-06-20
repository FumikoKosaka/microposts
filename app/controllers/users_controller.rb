class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
<<<<<<< HEAD
    @microposts = @user.microposts.order(created_at: :desc)
=======
    flash[:success] = "This page is your own page/"
>>>>>>> user-profile
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
    @user = User.find(params[:id])
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
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user , notice: 'プロフィールを編集しました'
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :prefecture,
                                 :password_confirmation)
  end
end