class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :home,
                                                  :procedure,
                                                  :about,
                                                  :plans,
                                                  :aupair_commitment,
                                                  :aupair_conditions ,
                                                  :family_commitment,
                                                  :family_conditions ]

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

  def aupair_commitment
  end

  def family_commitment
  end

  def aupair_conditions
  end

  def family_conditions
  end

end
