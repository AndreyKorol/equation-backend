module Api
  module V1
    class ApiController < ActionController::API
      before_action :cors_set_access_control_headers

      def cors_preflight_check
        head :ok
      end

      def cors_set_access_control_headers
        response.headers['Access-Control-Allow-Origin'] = '*'
        response.headers['Access-Control-Allow-Methods'] = 'POST, OPTIONS'
        response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token, Auth-Token, Email, X-User-Token, X-User-Email'
      end
    end
  end
end
