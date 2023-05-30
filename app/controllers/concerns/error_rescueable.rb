module ErrorRescueable
  extend ActiveSupport::Concern

  included do
    rescue_from Exception,
                with: :handle_500




    private
    def handle_500(e)
      render json: {error: {reason: "INTERNAL_SERVER_ERROR", message: e.message}}, status: :internal_server_error
    end
  end
end
