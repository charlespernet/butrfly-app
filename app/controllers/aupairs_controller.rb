class AupairsController < ApplicationController
  before_action :set_aupair, only: [:show, :edit, :update]

  def index
    @aupairs = Aupair.all
  end

  def show
  end

  def edit
  end

  def update
    @user.update(aupair_params)
    flash[:notice] = "Profil mis à jour"
    redirect_to dashboard_path
  end

  private

  def set_aupair
    @user = Aupair.find(params[:id])
    authorize @user
  end

  def aupair_params
    params.require(:aupair).permit(:first_name,:last_name, :birth_date, :country_code, :description, :driving_license, :musician, language_ids: [])
  end
end
