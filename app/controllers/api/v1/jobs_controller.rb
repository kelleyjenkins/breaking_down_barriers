class Api::V1::JobsController < ActionController::API

  def index
    render json: Job.all
  end
end
