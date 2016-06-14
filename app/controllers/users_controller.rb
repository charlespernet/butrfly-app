class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = params[:user][:type].constantize.new(new_user_params)

    if @user.save
      sign_in(@user)
      flash[:notice] = "Compte créé avec succès"
    else
      flash[:error] = "Un problème est survenu lors de la création de votre compte"
    end
    redirect_to root_path
  end

  private

  def new_user_params
    params.require(:user).permit(:email, :password, :country_code)
  end
end
