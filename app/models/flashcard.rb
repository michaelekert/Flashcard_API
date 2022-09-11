class Flashcard < ApplicationRecord
  validates :question, presence: true
  validates :answer, presence: true
  scope :today, -> {where(next_rep: Date.today)}
end
