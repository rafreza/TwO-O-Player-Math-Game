# Pick two numbers at random b/w 1 - 20
# Create a simple addition q with those two numbers
# Check answer

class Question
  attr_reader :newQ, :ans

  def initialize
    num1 = rand(1..20)
    num2 = rand(1..20)
    @newQ = "What does #{num1} plus #{num2} equal?"
    @ans = num1 + num2
  end
end