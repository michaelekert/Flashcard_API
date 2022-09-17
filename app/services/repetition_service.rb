class RepetitionService < ApplicationService

  attr_accessor :flashcard, :grade

  def initialize(flashcard,grade)
    @flashcard = flashcard
    @grade = Integer(grade)
  end

  def call
    repetition
  end

  private

  def repetition
        if grade > 5 || grade < 1
          errors.add(:wrong_grade, "Your grade #{grade} is too high or low. You can choosen 1-5")
        elsif flashcard.next_rep.after?(Date.today)
          errors.add(:not_today, "Next repetion: #{flashcard.next_rep}")
        else
          flashcard.update(
            interval: new_interval(grade),
            e_factory: new_e_factory(grade),
            next_rep: Date.today + new_interval(grade).days
          )
          flashcard
      end
    end


  def new_interval(grade)
    return 1 if grade < 3
    return 6 if flashcard.interval == 1

    (flashcard.interval * new_e_factory(grade)).round
  end

  def new_e_factory(grade)
    computed = flashcard.e_factory + (0.1 - ((5 - grade) * (0.08 + ((5 - grade) * 0.02))))
    [computed.round(4), 1.3].max
  end
  end

