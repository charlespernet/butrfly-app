class FamiliesController < ApplicationController
  before_action :set_family, only: [:show, :edit, :update]

  def index
    @families = Family.all
  end

  def show
  end

  def edit
  end

  def update
    @user.update(family_params)
    flash[:notice] = "Profil mis à jour"
    redirect_to dashboard_path
  end

  private

  def set_family
    @user = Family.find(params[:id])
    authorize @user
  end

  def family_params
    params.require(:family).permit(:name, :country_code, :smoker, :domestic_animal)
  end
end
