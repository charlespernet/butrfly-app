class FamiliesController < ApplicationController
  before_action :set_family, only: [:edit, :update]

  def edit
  end

  def update
  end

  private

  def set_family
    @user = Family.find(params[:id])
  end
end
