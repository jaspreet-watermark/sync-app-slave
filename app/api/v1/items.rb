module API::V1
  class Items < Grape::API

    resources :items do
      # GET /api/v1/items
      desc 'Returns all items, result is paginated'
      params do
        optional :limit, type: Integer, default: 10, desc: "Limit the number of returned orders, default to 10."
        optional :page,  type: Integer, default: 1, desc: "Specify the page of paginated results."
      end
      get rabl: 'items/items' do
        @items = Item.page(params[:page]).per(params[:limit])
      end
    end
  end
end
