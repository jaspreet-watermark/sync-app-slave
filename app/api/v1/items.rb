module API::V1
  class Items < Grape::API
    # helpers
    helpers ::API::V1::NamedParams
    helpers do
      def item_params(params)
        declared(params, include_missing: false)
      end
    end

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

      # POST /api/v1/items
      desc 'Creates/updates an item'
      params do
        use :item
      end
      post do
        @item = Item.find_or_create_by!(master_id: item_params(params)[:master_id])
        if @item.update(item_params(params))
          render rabl: 'items/item'
          status :ok
        else
          render rabl: 'items/errors'
          status :unprocessable_entity
        end
      end
    end
  end
end
