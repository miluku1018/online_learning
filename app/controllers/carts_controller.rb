class CartsController < ApplicationController
  before_action :authenticate_account!, only: [:checkout]
  layout 'course'

  def add
    current_cart.add_item(params[:id]) 
    session[:hippo2000] = current_cart.serialize 
    render json: {items: current_cart.items.count}
  end

  def show

  end

  def destroy
    session[:hippo2000] = nil
    redirect_to root_path, notice: '購物車已清空'
  end

  def checkout
    @order = Order.new
  end
end
