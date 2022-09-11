class FlashcardUpdateService < ApplicationService

  attr_accessor :flashcard ,:question, :answer

  def initialize(flashcard,question,answer)
    @flashcard = flashcard
    @question = question
    @answer = answer
  end

  def call
    update_flashcard
  end

  private

  def update_flashcard
    flashcard.update(
      question: question,
      answer: answer,
      interval: 1,
      e_factory: 2.5,
      next_rep: Date.today
    )
    flashcard
  end
end
