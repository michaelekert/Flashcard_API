require 'rails_helper'

def today_flashcard
  Flashcard.new(
    id: 1,
    question: "Today",
    answer: "Today",
    next_rep: Date.today,
    interval: 1,
    e_factory: 2.5
  )
end


def tomorrow_flashcard
  Flashcard.new(
    id: 1,
    question: "Maybe tommorow",
    answer: "Maybe tommorow",
    next_rep: Date.today + 1.days,
    interval: 1,
    e_factory: 2.5
  )
end

RSpec.describe RepetitionService, "call" do
  it "Successful if Flashcard next_rep variable is today or older" do
    action = RepetitionService.call(today_flashcard,5)
    expect(action.success?).to eq true
  end
  it "Unsuccessful if Flashcard next_rep variable is not today" do
    action = RepetitionService.call(tomorrow_flashcard,5)
    expect(action.success?).to eq false
  end
  it "If grade is 5, next_rep is in 6 days" do
    action = RepetitionService.call(today_flashcard,5)
    expect(action.result.next_rep).to eq Date.today + 6.days
  end
  it "If grade is lower or equal than 2, next_rep is in 1 days" do
    action = RepetitionService.call(today_flashcard,2)
    expect(action.result.next_rep).to eq Date.today + 1.days
  end
  it "If grade is higher than 5" do
    action = RepetitionService.call(today_flashcard,6)
    expect(action.errors.keys.first).to eq :wrong_grade
  end
  it "If grade is lower than 1" do
    action = RepetitionService.call(today_flashcard,-1)
    expect(action.errors.keys.first).to eq :wrong_grade
  end
end

