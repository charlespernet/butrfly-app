class AupairsController < ApplicationController
  before_action :set_aupair, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :plans]

  def index
    # raise
    search = params[:search]
    if search
      @country = search["country"].empty? ? Country.first : Country.find(search["country"])
      country_code = @country.code
      # @date = Date.new search["date(1i)"].to_i, search["date(2i)"].to_i, search["date(3i)"].to_i
      @date = Date.new *search["date"].split("-").map(&:to_i)
      @aupairs = Aupair.includes(:languages).dispo_at_date(@date).want_to_come_to(country_code)
    else
      @aupairs = Aupair.all.includes(:languages)
    end
  end

  def show
  end

  def edit
  end

  def update
    @user.update(aupair_params)
    flash[:notice] = "Profil mis à jour"
    redirect_to @user
  end

  def plans
    @plans = Aupair.plans
  end

  private

  def set_aupair
    @user = Aupair.find(params[:id]).decorate
    authorize @user
  end

  def aupair_params
    p = params.require(:aupair).permit(
      :first_name,
      :last_name,
      :country_code,
      :gender,
      :birth_date,
      :email,
      :description,
      :driving_license,
      :musician,
      :stay_duration,
      :dispo_from,
      :experience_aupair,
      :educational_experience,
      :accepted_domestic_animal,
      :sports,
      :phone,
      :address,
      :city,
      :country,
      :environment,
      :favorite_region,
      :housework,
      spoken_languages: [],
      language_ids: [],
      country_ids: [],
      photos: []
    )
    p[:environment] = p[:environment].to_i  if p[:environment].present?
    p[:birth_date] = DateTime.parse(p[:birth_date]) if p[:birth_date].present?
    p
  end





end
