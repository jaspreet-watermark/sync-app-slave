# frozen_string_literal: true

require 'spec_helper'

describe API::V1::Items do

  describe 'GET /api/v1/items' do
    context 'without tag filter' do
      before do
        2.times { create(:item) }
      end
      it 'returns all items' do
        get '/api/v1/items'
        expect(parsed_json["items"].count).to eq(2)
        expect(response.status).to eq(200)
      end
    end

    context 'with tag filter' do
      before do
        2.times { create(:item) }
      end
      it 'returns items having tag test' do
        get '/api/v1/items'
        expect(parsed_json["items"].count).to eq(1)
        expect(response.status).to eq(200)
      end
    end
  end
end
