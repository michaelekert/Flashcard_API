require 'rails_helper'


def valid_params
  Flashcard.new(
    id: 11,
    question: "Example",
    answer: "Example",
    next_rep: Date.today,
    e_factory: 2.5,
    interval: 1
  )
end


RSpec.describe FlashcardCreateService, "call" do
  it "Destroy flashcard" do
    action = FlashcardDestroyService.call(valid_params)
    expect(action.success?).to eq true
  end

end
