# frozen_string_literal: true

module API
  module V1
    module NamedParams
      extend ::Grape::API::Helpers

      params :item do
        requires :master_id, type: String, desc: 'Item Master ID'
        requires :title, type: String, desc: 'Item Title'
        requires :description, type: String, desc: 'Item Description'
        requires :status, type: String, desc: 'Item Status'
        requires :deleted_at, type: String, desc: 'Item Deleted AT'
      end
    end
  end
end
