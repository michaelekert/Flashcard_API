class FlashcardDestroyService < ApplicationService
  attr_accessor :flashcard
  def initialize(flashcard)
    @flashcard = flashcard
  end

  def call
    flashcard.destroy
  end
end
