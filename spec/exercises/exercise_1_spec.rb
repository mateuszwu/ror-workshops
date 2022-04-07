# Exercise 1 - Basics + exceptions
# - Implement class that fulfills requirements provided in tests
# - Tests cannot be changed

# References
# https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/raise-error-matcher

# Place implementation below
class Calculator
  def add(x, y)
    if (x.is_a?(Integer) || x.is_a?(Float)) && (y.is_a?(Integer) || y.is_a?(Float))
      x + y
    else
      raise "Works only for numbers"
    end
  end
end

# Tests below
RSpec.describe Calculator do
  describe '#add' do
    it 'adds to numbers' do
      expect(Calculator.new.add(1, 3)).to eq 4
    end

    it 'works for floats' do
      expect(Calculator.new.add(1, 3.5)).to eq 4.5
    end

    context 'when provided with string as argument' do
      it 'raises "Works only for numbers"' do
        expect { Calculator.new.add(1, 'abc') }.to raise_exception(RuntimeError, 'Works only for numbers')
        expect { Calculator.new.add('1', 2) }.to raise_exception(RuntimeError, 'Works only for numbers')
      end
    end
  end
end
