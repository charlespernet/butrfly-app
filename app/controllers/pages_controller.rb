class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home, :procedure, :about, :plans]
  skip_before_action :authenticate_user!, only: [:home, :procedure, :about, :plans]
  def home
  end

  def dashboard
    @user = current_user.specific.decorate
  end

  def procedure
  end

  def about

  end

  def congratulations
  end

  # def plans
  # end
end
