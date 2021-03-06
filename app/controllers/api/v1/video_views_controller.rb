class Api::V1::VideoViewsController < Api::V1::BaseController
  resource_description do
    formats ['json']
    error 422, I18n.t('doc.v1.video_views.errors.e422')
  end
  api :POST, '/v1/video_views', I18n.t('doc.v1.video_views.create')
  param :customer_id, :number, required: true, desc: I18n.t('doc.v1.video_views.customer')
  param :video_id, :number, required: true, desc: I18n.t('doc.v1.video_views.video')
  def create
    VideoView.create(video_view_params)
  end

  private

  def video_view_params
    params.require(:video_view).permit(:customer_id, :video_id)
  end
end
