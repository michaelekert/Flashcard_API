class FlashcardUpdateService < ApplicationService

  attr_accessor :flashcard ,:question, :answer

  def initialize(flashcard,question,answer)
    @flashcard = flashcard
    @question = question
    @answer = answer
  end

  def call
    if question.blank? || answer.blank?
      errors.add(:missing_params, "Missing params")
    else
      update_flashcard
    end
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
