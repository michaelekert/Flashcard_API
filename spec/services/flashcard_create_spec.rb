require 'rails_helper'



RSpec.describe FlashcardCreateService, "call" do
  it "Create a new flashcard" do
    action = FlashcardCreateService.call("Question","Answer")
    expect(action.success?).to eq true
    expect(action.result.question).to eq "Question"
  end
  it "Throws a missing params error" do
    result = FlashcardCreateService.call("Question","")
    expect(result.errors.keys.first).to eq :missing_params
  end
end
