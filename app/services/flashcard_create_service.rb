class FlashcardCreateService < ApplicationService


  def initialize(question,answer)
    @question = question
    @answer = answer
    @next_rep = Date.today
    @e_factory = 2.5
    @interval = 1
  end

  def call
    create_flashcard
  end

  private

  def create_flashcard
    if @question.blank? || @answer.blank?
      errors.add(:missing_params, "Missing params")
    else
    Flashcard.create(
      question: @question,
      answer: @answer,
      next_rep: @next_rep,
      e_factory: @e_factory,
      interval: @interval
    )
    end
  end

end
