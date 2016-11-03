class PaymentsController < ApplicationController
  def new
  end

  def create
    # TODO: refacto cette merde

    # check if user is active
    if current_user.active?
      flash[:info] = "Un abonnement est déjà en cours"
      return redirect_to root_path
    end

    # Retrieve or Create a StipeCustomer
    if !current_user.stripe_id
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
      )
      current_user.update(stripe_id: customer.id)
      customer
    else
      customer = Stripe::Customer.retrieve(current_user.stripe_id)
    end

    # set new default card
    card = customer.sources.create(source: params[:stripeToken])
    customer.default_source = card.id
    customer.save

    begin
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => params[:amount_cents],
        :description => 'Butrfly customer',
        :currency    => 'eur'
      )
    rescue Stripe::CardError => e
      flash[:error] = e.message
      return redirect_to plans_path
    end

    if charge["paid"]
      # paiement pour les familles de deux mois a updater pour les aupairs
      active_until = (Date.today + params[:duration].to_i.months)
      current_user.update(active_until: active_until)
      flash[:success] = "Votre abonnement est maintenant actif"
      redirect_to root_path
    end
  end
end
