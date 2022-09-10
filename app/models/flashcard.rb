class Flashcard < ApplicationRecord

  scope :today, -> {where(next_rep: Date.today)}
end
