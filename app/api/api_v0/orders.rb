module ApiV0
  class Orders < Grape::API
    
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
      get do
       
      end

      desc 'Create an order.'
      params do
        requires :quantity, type: Integer, desc: '數量'
        requires :total_price, type: Integer, desc: '總計'
      end
      post do
        { 'declared_params' => declared(params, include_missing: false) }
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