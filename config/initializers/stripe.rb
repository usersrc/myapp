if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_xKEouL8bZTyE7TLLpaxnvwv3',
    :secret_key => 'sk_test_r8URV5lPHN5qXUg4W1eOoHi7'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
