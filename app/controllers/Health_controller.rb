class HealthController < ActionController::API
  include ::ErrorRescueable

  def check
    render json: {data: "haha"}
  end
end
