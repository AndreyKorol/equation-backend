module Api
  module V1
    class EquationsController < ApiController
      render_exception = -> (exception) { render json: { error: exception.message } }
      rescue_from('TypeError', &render_exception)
      rescue_from('Equation::CoefficientError', &render_exception)

      def linear
        solver = EquationSolver.new(params[:coefficients], :linear)
        root = solver.solve
        render json: { root: root }
      end

      def quadratic
        solver = EquationSolver.new(params[:coefficients], :quadratic)
        roots = solver.solve
        render json: { roots: roots }
      end
    end
  end
end
