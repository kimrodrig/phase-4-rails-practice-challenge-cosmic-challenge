class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    private

    def render_not_found_response(obj)
        render json: {error: "#{obj.model} not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(obj)
        render json: {errors: obj.record.errors.full_messages}, status: :unprocessable_entity
    end

end
