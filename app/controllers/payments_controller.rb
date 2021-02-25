class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[ show edit update destroy ]

  # GET /payments/1/edit 
  def index 
    @order = Order.find(params[:order_id])
    @payment_methods = PaymentMethod.all
  end


  # GET /payments/1/edit 
  def new 
    @payment = Payment.new
    @order = Order.find(params[:order_id])
    @payment_method = PaymentMethod.find(params[:payment_method_id])
    @tbk_alert = false
    @tbk_alert = true if @payment_method.id == 4 
  end

  # POST /payments or /payments.json
  def create
    @payment = Payment.new(payment_params)
    @order = Order.find(params[:order_id])
    @payment.order_id = @order.id
    @payment.total = @order.total
    @payment.state = "Completed"
    @payment.token = "tkn" #ONLY DURING TESTS
    @payment.payment_method_id = params[:payment][:payment_method_id]
    @order.state = "Completed"
    @order.save
    respond_to do |format|
      if @payment.save
        format.html { redirect_to root_path, notice: "Payment was successfully created." }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:order_id])
    end

    # Only allow a list of trusted parameters through.
    def payment_params
      payment_validation.select {|k,v| k != "account_number" && k != "password" }
    end

    def payment_validation
      params.require(:payment).permit(:order_id, :payment_method_id, :state, :total, :token, :account_number, :password)
    end
end
