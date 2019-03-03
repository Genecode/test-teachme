require 'rails_helper'

RSpec.describe Api::V1::VideoController, type: :controller do
  describe "#GET" do
    it 'should be 5 video thread' do
      5.times { |n| $redis.set("customer_id:#{n}:video_id:1", '') }
      get :show, params: { id: '1' }, format: :json
      expect(JSON.parse(response.body)['customer_count']).to eq 5
    end
  end
end
