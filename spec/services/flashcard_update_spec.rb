require 'rails_helper'


RSpec.describe FlashcardUpdateService, "call" do
  it "Update flashcard" do
    pre = FlashcardCreateService.call("Preupdated question","Preupdated answer")
    action = FlashcardUpdateService.call(pre.result,"Changed question", "Changed answer")
    expect(action.success?).to eq true
    expect(Flashcard.count).to eq 1
    expect(action.result.question).to eq "Changed question"
  end
  it "Fail update flashcard without question" do
    pre = FlashcardCreateService.call("Preupdated question","Preupdated answer")
    action = FlashcardUpdateService.call(pre.result, nil, "Changed answer")
    expect(action.success?).to eq false
  end
  it "Fail update flashcard without answer" do
    pre = FlashcardCreateService.call("Preupdated question","Preupdated answer")
    action = FlashcardUpdateService.call(pre.result, "Changed question", nil)
    expect(action.success?).to eq false
  end
end
