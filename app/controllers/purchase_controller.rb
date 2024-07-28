class PurchaseController <ApplicationController
    before_action :set_product
    def show
    end

    def stripe_session
        session = Stripe::Checkout::Session.create({
    ui_mode: 'embedded',
    line_items: [{
      # Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
      price_data: {
        currency: "usd",
        unit_amount: (@product.price * 100).to_i,
        product_data: {
            name: @product.title
        },
      },
      quantity: 1,
    }],
    shipping_address_collection: {
      allowed_countries: ["US"]
    },
    mode: 'payment',
    return_url: success_product_purchase_index_url(@product),
  })

        render json: {clientSecret: session.client_secret}
    end

    def success
    end

    private
        # Use callbacks to share common setup or contraints between actions.
        def set_product
            @product = Product.friendly.find(params[:product_id])
        end
end