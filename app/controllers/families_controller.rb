class FamiliesController < ApplicationController
  before_action :set_family, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :plans]

  def index
    search = params[:search]
    if search
      @country = Country.find(search["country"])
      country_code = @country.code
      @date = Date.new search["date(1i)"].to_i, search["date(2i)"].to_i, search["date(3i)"].to_i
      @families = Family.from_country(country_code).searching_at_date(@date)
    else
      @country_code = "FR"
      @date = Date.today
      @families = Family.all
    end
  end

  def show
  end

  def edit
  end

  def update
    @user.update(family_params)
    flash[:notice] = "Profil mis à jour"
    redirect_to @user
  end

  def plans
    @plans = Family.plans
  end

  private

  def set_family
    @user = Family.find(params[:id]).decorate
    authorize @user
  end

  def family_params
    p = params.require(:family).permit(
      :name,
      :country_code,
      :domestic_animal,
      :description,
      :family_type,
      :prefered_gender,
      :starting_date,
      :prefered_duration,
      :experience_with_aupair,
      :children_age_from,
      :children_age_to,
      :children_number,
      :housework,
      :driving_license_required,
      :first_name,
      :last_name,
      :phone,
      :address,
      :city,
      :country,
      :aupair_children_number,
      :house_type,
      :environment,
      :aupair_experience,
      :aupair_nationality,
      # :aupair_languages,
      photos: []
    )
  end

end
