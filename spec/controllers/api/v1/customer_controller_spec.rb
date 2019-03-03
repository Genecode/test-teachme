require 'rails_helper'

RSpec.describe Api::V1::CustomerController, type: :controller do
  describe "#GET" do
    it 'should be 5 customer' do
      5.times { |n| $redis.set("customer_id:2:video_id:#{n}", '') }
      get :show, params: {  id: '2' }, format: :json
      expect(JSON.parse(response.body)['video_count']).to eq 5
    end
  end
end
