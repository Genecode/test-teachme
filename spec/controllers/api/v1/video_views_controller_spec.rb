require 'rails_helper'

RSpec.describe Api::V1::VideoViewsController, type: :controller, redis: true do
  describe "POST#create" do
    it 'create new video_view in database' do
      post :create, params: { customer_id: '2', video_id: '1' }, format: :json
      expect($redis.keys.count).to eq 1
      expect($redis.exists('customer_id:2:video_id:1')).to be_truthy
    end

    context 'video view invalid params' do
      it 'returns code 422' do
        post :create, params: { customer_id: '', video_id: '' }, format: :json
        expect(response.code).to eq '422'
      end
      it 'returns error description' do
        post :create, params: { customer_id: '', video_id: '' }, format: :json
        errors = JSON.parse(response.body)['errors']
        expect(errors).to be
      end
      it 'dos not create video view in database' do
        $redis.flushdb
        post :create, params: { customer_id: '', video_id: '' }, format: :json
        expect($redis.keys.count).to eq 0
      end
    end
  end
end
