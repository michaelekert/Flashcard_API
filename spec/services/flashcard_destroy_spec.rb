require 'rails_helper'


RSpec.describe FlashcardDestroyService, "call" do
  it "Destroy flashcard" do
    create_flashcard = FlashcardCreateService.call("Predestroy question","Predestroy answer")
    action = FlashcardDestroyService.call(create_flashcard.result)
    expect(action.success?).to eq true
    expect(Flashcard.count).to eq 0
  end
end
