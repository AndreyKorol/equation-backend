require 'rails_helper'
require_relative '../../lib/equation'

describe EquationSolver do
  describe 'type' do
    it 'getter' do
      solver = EquationSolver.new([1, 2], :linear)
      expect(solver.type).to eq(:linear)
    end

    it 'setter' do
      solver = EquationSolver.new([1, 2], :linear)
      solver.type = :quadratic

      expect(solver.type).to eq(:quadratic)
    end
  end

  describe 'solve linear equation' do
    it 'with wrong number of coefficients' do
      solver = EquationSolver.new('String', :linear)

      expect{solver.solve}.to raise_error TypeError, "wrong type of coefficients (given String, expected Array)"
    end

    it 'with wrong number of coefficients' do
      solver = EquationSolver.new([0, 10, 1], :linear)

      expect{solver.solve}.to raise_error Equation::CoefficientError, "wrong number of coefficients (given 3, expected 2)"
    end

    it 'with infinite set of solution' do
      solver = EquationSolver.new([0, 0], :linear)

      expect(solver.solve).to eq([-Float::INFINITY..Float::INFINITY])
    end

    it 'with no roots' do
      solver = EquationSolver.new([0, 10], :linear)

      expect(solver.solve).to eq([])
    end

    it 'with root' do
      solver = EquationSolver.new([2, -10], :linear)

      expect(solver.solve).to eq([5])
    end
  end

  describe 'solve quadratic equation' do
    it 'with wrong type of coefficients' do
      solver = EquationSolver.new('String', :quadratic)

      expect{solver.solve}.to raise_error TypeError, "wrong type of coefficients (given String, expected Array)"
    end

    it 'with wrong number of coefficients' do
      solver = EquationSolver.new([0, 10], :quadratic)

      expect{solver.solve}.to raise_error Equation::CoefficientError, "wrong number of coefficients (given 2, expected 3)"
    end

    it 'with wrong value of `a` coefficient' do
      solver = EquationSolver.new([0, 3, 10], :quadratic)

      expect{solver.solve}.to raise_error Equation::CoefficientError, "wrong value of `a` coefficient (can't be 0)"
    end

    it 'with positive discriminant and integer roots' do
      solver = EquationSolver.new([1, -8, 12], :quadratic)

      expect(solver.solve).to eq([6, 2])
    end

    it 'with zero discriminant' do
      solver = EquationSolver.new([2, -4, 2], :quadratic)

      expect(solver.solve).to eq([1])
    end

    it 'with negative discriminant' do
      solver = EquationSolver.new([4, 4, 5], :quadratic)

      expect(solver.solve).to eq([(-0.5+1i), (-0.5-1i)])
    end
  end
end
