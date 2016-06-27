class AupairsController < ApplicationController
  before_action :set_aupair, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: :index

  def index
    @aupairs = Aupair.all.includes(:languages)
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
    params.require(:aupair).permit(
      :first_name,
      :last_name,
      :birth_date,
      :country_code,
      :gender,
      :description,
      :driving_license,
      :musician,
      :stay_duration,
      :dispo_from,
      :experience_aupair,
      :educational_experience,
      :accepted_domestic_animal,
      :sports,
      language_ids: [],
      country_ids: []
    )
  end
end
