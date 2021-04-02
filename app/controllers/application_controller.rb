require 'pry'
class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotDestroyed, with: :not_detroyed

    private
    def not_detroyed(e)
      render json: {errors: e.record.errros}, status: :unprocessable_entity
    end
  
end
