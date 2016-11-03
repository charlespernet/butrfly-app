class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :plans]

  def home
  end

  def dashboard
    @user = current_user.specific.decorate
  end

  def plans
  end
end
