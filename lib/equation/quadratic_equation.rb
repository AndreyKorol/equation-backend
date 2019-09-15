require_relative 'equation'

class QuadraticEquation < Equation
  def solve(coefficients)
    raise TypeError, "wrong type of coefficients (given #{coefficients.class}, expected Array)" if coefficients.class != Array
    raise CoefficientError, "wrong number of coefficients (given #{coefficients.size}, expected 3)" if coefficients.size != 3
    raise TypeError, 'wrong type of coefficient' if coefficients.any? { |coefficient| !coefficient.class.ancestors.include?(Numeric) }
    raise CoefficientError, "wrong value of `a` coefficient (can't be 0)" if coefficients.first == 0

    a, b, c = coefficients
    discriminant = b ** 2 - 4 * a * c
    sqrt_discriminant = discriminant >= 0 ? Math.sqrt(discriminant) : Math.sqrt(discriminant.to_c)

    first_root = (-b + sqrt_discriminant) / (2 * a)
    second_root = (-b - sqrt_discriminant) / (2 * a)

    [first_root, second_root].uniq
  end
end
