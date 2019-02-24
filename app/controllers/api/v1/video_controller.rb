class Api::V1::VideoController < Api::V1::BaseController
  resource_description do
    formats ['json']
  end
  api :GET, '/v1/video/:id', I18n.t('doc.v1.video.show')
  param :id, :number, required: true, desc: I18n.t('doc.v1.video.id')
  example <<~EXAMPLE
    {
      "code": 200,
      "customer_count": 2
    }
  EXAMPLE
  def show
    @search_template = "*:video_id:#{params[:id]}"
    @customer_count = $redis.keys(@search_template).count
    render json: { code: 200, customer_count: @customer_count }, status: 200
  end
end
