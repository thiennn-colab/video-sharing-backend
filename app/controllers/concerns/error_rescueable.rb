module ErrorRescueable
  extend ActiveSupport::Concern

  included do
    rescue_from Exception,
                with: :handle_500

    rescue_from ActiveRecord::RecordInvalid,
                with: :handle_422




    private
    def handle_500(e)
      render json: {error: {reason: "INTERNAL_SERVER_ERROR", messages: [e.message]}}, status: :internal_server_error
    end

    def handle_422(e)
      render json: {error: {reason: "Validation failed", messages: e.record.errors.messages}}, status: :unprocessable_entity
    end
  end
end
