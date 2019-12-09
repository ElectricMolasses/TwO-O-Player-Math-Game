# Generates math questions and returns whether or
# not a given answer is correct
class Question
  attr_reader :a, :b, :question

  def initialize
    @a = rand(1..20)
    @b = rand(1..20)
    @question = "What does #{@a} plus #{@b} equal?"
  end

  def answer(guess)
    guess.to_i == @a + @b
  end
end