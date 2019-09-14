require_relative 'linear_equation'
require_relative 'quadratic_equation'

class EquationSolver
  SOLVERS = {
    linear: LinearEquation,
    quadratic: QuadraticEquation
  }

  attr_accessor :coefficients
  attr_reader :solver

  def initialize(coefficients, type)
    @coefficients = coefficients
    @solver = SOLVERS[type].new
  end

  def type=(type)
    @solver = SOLVERS[type].new
  end

  def solve
    solver.solve(coefficients)
  end
end
