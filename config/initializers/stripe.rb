Rails.configuration.stripe = {
  # PUBLISHABLE_KEY=pk_test_OJKyJjTrFEKFPJeuUHQOQd0B SECRET_KEY=sk_test_JW7SyU5dObqZSr3jZnrzkv5b
  # card no: 4242 4242 4242 4242
  :publishable_key => "pk_test_OJKyJjTrFEKFPJeuUHQOQd0B",
  :secret_key      => "sk_test_JW7SyU5dObqZSr3jZnrzkv5b"
  # :publishable_key => ENV['PUBLISHABLE_KEY'],
  # :secret_key      => ENV['SECRET_KEY']  
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]



# Stripe.api_key = "sk_test_JW7SyU5dObqZSr3jZnrzkv5b"
# STRIPE_PUBLIC_KEY = "pk_test_OJKyJjTrFEKFPJeuUHQOQd0B"



