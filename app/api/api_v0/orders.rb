module ApiV0
  class Orders < Grape::API
    before { authenticate! }
    resource :orders do
      get do
        api_response(::Orders.all.to_json)
      end

      helpers do
        params :attributes do
          optional :attributes, type: Hash, default: {}
        end
      end

      desc 'Return an order.'
      params do
        requires :id, type: Integer, desc: 'Order id.'
      end
      route_param :id do
        get do
          Order.find(params[:id])
        end
      end

      desc 'Return all orders.'
        get "/orders" do
          orders = current_account.orders

          present orders, with: ApiV0::Entities::Order
        end

      desc 'Create an order.'
      params do
        requires :quantity, type: Integer
        requires :total_price, type: Integer
      end
      post "/orders" do
        order = current_account.orders.new(declared(params, include_missing: false))

        if order.save
          present order, with: ApiV0::Entities::Order
        else
          raise StandardError, $!
        end
      end

      desc 'Delete an order.'
      params do
        requires :id, type: Integer, desc: 'order id.'
      end
      route_param :id do
        delete do
          Order.find(params[:id]).destroy
        end
      end
    end
  end
end