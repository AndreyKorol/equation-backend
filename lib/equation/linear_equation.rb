require_relative 'equation'

class LinearEquation < Equation
  def solve(coefficients)
    raise TypeError, "wrong type of coefficients (given #{coefficients.class}, expected Array)" if coefficients.class != Array
    raise CoefficientError, "wrong number of coefficients (given #{coefficients.size}, expected 2)" if coefficients.size != 2

    a, b = coefficients

    if a == 0 && b == 0
      [-Float::INFINITY..Float::INFINITY]
    elsif a == 0 && b != 0
      []
    else
      [-b/a.to_f]
    end
  end
end
