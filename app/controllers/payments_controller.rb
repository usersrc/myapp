class PaymentsController < ApplicationController
  # POST /payment
  def create
    @product = params[:product_id]
    @user = current_user
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => @product.price_in_cents, # amount in cents, again
        :currency => "usd",
        :source => token,
        :description => params[:stripeEmail]
      )
      if charge.paid
        Order.create(product_id: @product.id, user_id: @user.id, total: @product.price_in_cents)
      end
    rescue Stripe::CardError => e
      # The card has been declined
    end
    redirect_to product_path(@product)
  end
end
