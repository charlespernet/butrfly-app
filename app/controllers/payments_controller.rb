class PaymentsController < ApplicationController
  def new
  end

  def create
    current_user.set_new_default_card(params[:stripeToken])
    current_user.create_charge(params[:amount_cents])
    current_user.create_subscription(params[:plan_id])
    flash[:notice] = "Votre abonnement est maintenant actif"
    redirect_to root_path
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to plans_path
  end
end
