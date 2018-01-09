class PaymentsController < ApplicationController
  def new
  end

  def create
    # if current_user.active?
    #   flash[:notice] = "Un abonnement est déjà en cours"
    # else
    current_user.set_new_default_card(params[:stripeToken])
    current_user.create_charge(params[:amount_cents])
    flash[:notice] = "Votre abonnement est maintenant actif"
    # end
    redirect_to root_path
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to plans_path
  end
end
