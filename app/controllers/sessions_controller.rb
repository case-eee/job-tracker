class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.find_by(email: params[:user][:email])
    if @user.authenticate(params[:user][:password])
      session[:current_user_id] = @user.id
      flash[:success] = "#{@user.name} logged in"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to login_path
  end

end
