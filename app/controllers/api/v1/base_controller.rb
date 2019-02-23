class Api::V1::BaseController < ApplicationController
  rescue_from Apipie::ParamMissing, Apipie::ParamInvalid do |e|
    render json: { code: 421, errors: [e.message] }, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { code: 404, errors: [e.message] }, status: :not_found
  end
end