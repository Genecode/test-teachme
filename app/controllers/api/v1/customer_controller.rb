class Api::V1::CustomerController < Api::V1::BaseController

  resource_description do
    formats ['json']
  end
  api :GET, '/v1/customer/:id', I18n.t('doc.v1.customer.show')
  param :id, :number, required: true, desc: I18n.t('doc.v1.customer.id')
  example <<~EXAMPLE
    {
      "code": 200,
      "video_count": 2
    }
  EXAMPLE
  def show
    @video_count = VideoView.watch_now.where(customer_id: params[:id].to_i).count
    render json: { code: 200, video_count: @video_count }, status: 200
  end
end
